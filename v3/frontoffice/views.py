#-*-coding:utf-8
# Create your views here.

from django.shortcuts import render
from django.db import connection
from django.core.context_processors import csrf
from django.contrib import auth
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned
from frontoffice.models import ActiviteB, Operation, LigneBudget, Themes
from frontoffice.forms import OperationCaisseForm, OperationBancaireForm
from django.utils.translation import gettext_lazy as _
import json


def login(request):
    c = {}
    c.update(csrf(request))
    return render(request, 'frontoffice/login.html', c)


def auth_view(request):
    username = request.POST.get('username', '')
    password = request.POST.get('password', '')
    user = auth.authenticate(username=username, password=password)
    if user is not None:
        auth.login(request, user)
        request.session['first_name'] = user.first_name
        request.session['last_name'] = user.last_name
        request.session['langue'] = user.profile.pays.langue
        request.session['pays'] = user.profile.pays
        request.session['projet'] = user.profile.pays.short_name
        request.session.modified = True
        return HttpResponseRedirect('/homepage', locals())
    else:
        return HttpResponseRedirect('/')


@login_required(login_url=login)
def homepage(request):
    the_title = _('Accueil')
    #operation = Operation.objects.all().order_by('-date_operation')[:5]
    operation = Operation.objects.raw("SELECT a.id, a.libelle_operation, a.date_operation, "
                                      "a.somme_operation, b.libelle_ligne "
                                      "FROM frontoffice_operation a, frontoffice_lignebudget b "
                                      "WHERE a.ligne_budget_id=b.id order by a.date_operation DESC LIMIT 5")
    return render(request, 'frontoffice/tableau_de_bord.html', locals())


def deconnexion(request):
    auth.logout(request)
    return HttpResponseRedirect('/')


@login_required(login_url=login)
def gestion_op(request):
    the_title = _('Gestion operation')
    pourcentage_mois = Operation.objects.raw("SELECT ((sum(a.somme_operation)*100)/sum(b.montant)) as p_mois  "
                                             "FROM frontoffice_operation a, frontoffice_lignebudget c, "
                                             "frontoffice_elementmensuel b "
                                             "WHERE month(a.date_operation)=month(now()) AND a.ligne_budget_id=c.id "
                                             "AND c.elementPlanMensuel_id=b.id")
    #operation = Operation.objects.all().order_by('-date_operation')
    #oper = Operation.objects.select_related()
    opp_sql = Operation.objects.raw("SELECT a.id, a.date_operation, month(a.date_operation), a.somme_operation, "
                                    "b.libelle_ligne, c.libelle_activite, d.libelle_theme, d.id as theme_id, "
                                    "a.soumission "
                                    "FROM frontoffice_operation a, frontoffice_lignebudget b, frontoffice_activiteb c, "
                                    "frontoffice_themes d "
                                    "WHERE a.ligne_budget_id=b.id and b.activite_id=c.id and c.theme_id=d.id")
    themes = []
    for op in opp_sql:
        if op.libelle_activite not in themes:
            themes.append(op.libelle_activite)
    return render(request, 'frontoffice/gestion_operation.html', locals())


def get_activites(request):
    theme_id = request.GET['id']
    activites, dict_act, data = [], [], []
    try:
        activites = ActiviteB.objects.filter(theme_id=theme_id)
        for act in activites:
            dict_act.append({'id': act.id, 'activite': act.libelle_activite})
        data = json.dumps(dict_act)
    except ObjectDoesNotExist:
        pass
    return HttpResponse(data, content_type="text/json")


def get_lignes(request):
    activite_id = request.GET['id']
    lignes = LigneBudget.objects.filter(activite_id=activite_id)
    lignes, dict_act, data = [], [], []
    try:
        lignes = LigneBudget.objects.filter(activite_id=activite_id)
        for l in lignes:
            dict_act.append({'id': l.id, 'libelle': l.libelle_ligne, 'restant': (l.montantPrevu - l.montantExecute)})
        data = json.dumps(dict_act)
    except ObjectDoesNotExist:
        pass
    return HttpResponse(data, content_type="text/json")


@login_required(login_url=login)
def add_caisse_op(request):
    the_title = _('Ajouter operation caisse')
    themes = Themes.objects.all()
    type_op = 'caisse'
    if request.POST:
        form1 = OperationCaisseForm(request.POST)
        if form1.is_valid():
            op = form1.save(commit=False)
            ligne = request.POST.get('ligne', '')
            op.ligne_budget_id = ligne
            op.save()
            return HttpResponseRedirect('/gestion_operation', locals())
    else:
        form1 = OperationCaisseForm()
    args = {}
    args.update(csrf(request))
    args['form1'] = form1
    args['themes'] = themes
    return render(request, 'frontoffice/ajouter_op_banque.html', locals())


@login_required(login_url=login)
def add_bank_op(request):
    the_title = _('Ajouter operation banque')
    type_op = 'banque'
    themes = Themes.objects.all()
    if request.POST:
        form1 = OperationBancaireForm(request.POST)
        if form1.is_valid():
            op = form1.save(commit=False)
            ligne = request.POST.get('ligne', '')
            op.ligne_budget_id = ligne
            op.save()
            return HttpResponseRedirect('/gestion_operation', locals())
    else:
        form1 = OperationBancaireForm()
    args = {}
    args.update(csrf(request))
    args['form1'] = form1
    args['themes'] = themes
    return render(request, 'frontoffice/ajouter_op_banque.html', locals())


@login_required(login_url=login)
def statistique(request):
    the_title = _('Statistique')
    return render(request, 'frontoffice/statistiques.html', locals())


@login_required(login_url=login)
def suivi_budget(request):
    the_title = _('Suivi budget')
    themes = Themes.objects.all()
    for th in themes:
        th.activites = ActiviteB.objects.filter(theme=th)
    #activites = ActiviteB.objects.all()
    #total_prevu, total_exec, total_restant = 0, 0, 0
    #for activite in activites:
    #    activite.somme = 0
     #   for ligne in LigneBudget.objects.filter(activite=activite):
      #      activite.somme = ligne.montantExecute
      #  activite.restant = activite.montantPrevu - activite.somme
       # total_prevu += activite.montantPrevu
        #total_exec += activite.somme
        #total_restant += activite.restant
    id_tab = 0
    return render(request, 'frontoffice/suivi_budget.html', locals())


@login_required(login_url=login)
def soumettre(request):
    try:
        Operation.objects.filter(soumission='Brouillon').update(soumission='Soumise')
    except ObjectDoesNotExist:
        return HttpResponse('Erreur soumission données')
    return HttpResponseRedirect('/gestion_operation')