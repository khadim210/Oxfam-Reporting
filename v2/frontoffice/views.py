# Create your views here.

from django.shortcuts import render
from django.core.context_processors import csrf
from django.contrib import auth
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist, MultipleObjectsReturned
from frontoffice.models import ActiviteB, Operation, LigneBudget, Themes
from frontoffice.forms import OperationCaisseForm, OperationBancaireForm
from django.core import serializers
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
    operation = Operation.objects.all().order_by('-date_operation')[:5]
    return render(request, 'frontoffice/tableau_de_bord.html', locals())


def deconnexion(request):
    #request.session = {}
    auth.logout(request)
    return HttpResponseRedirect('/')


@login_required(login_url=login)
def gestion_op(request):
    the_title = _('Gestion operation')
    operation = Operation.objects.all().order_by('-date_operation')
    themes = []
    for op in operation:
        if op.ligne_budget.activite not in themes:
            themes.append(op.ligne_budget.activite)
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


def add_caisse_op(request):
    the_title = _('Ajouter operation caisse')
    themes = Themes.objects.all()
    type_op = 'caisse'
    if request.POST:
        form1 = OperationCaisseForm(request.POST)
        if form1.is_valid():
            op = form1.save(commit=False)
            ligne = request.POST.get('ligne_budget_id', '')
            l_budget = LigneBudget.objects.get(libelle_ligne='Ligne budget depense technique')
            op.ligne_budget = l_budget
            op.save()
            return render(request, 'frontoffice/gestion_operation.html')
    else:
        form1 = OperationCaisseForm()
    args = {}
    args.update(csrf(request))
    args['form1'] = form1
    args['themes'] = themes
    return render(request, 'frontoffice/ajouter_op_banque.html', locals())


def add_bank_op(request):
    the_title = _('Ajouter operation banque')
    type_op = 'banque'
    themes = Themes.objects.all()
    if request.POST:
        form1 = OperationBancaireForm(request.POST)
        if form1.is_valid():
            op = form1.save(commit=False)
            ligne = request.POST.get('ligne_budget_id', '')
            l_budget = LigneBudget.objects.get(libelle_ligne='Ligne budget depense technique')
            op.ligne_budget = l_budget
            op.save()
            return render(request, 'frontoffice/gestion_operation.html')
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
    return render(request, 'frontoffice/statistiques.html')

@login_required(login_url=login)
def suivi_budget(request):
    the_title = _('Suivi budget')
    activites = ActiviteB.objects.all()
    total_prevu, total_exec, total_restant = 0, 0, 0
    for activite in activites:
        activite.somme = 0
        for ligne in LigneBudget.objects.filter(activite=activite):
            activite.somme = ligne.montantExecute
        activite.restant = activite.montantPrevu - activite.somme
        total_prevu += activite.montantPrevu
        total_exec += activite.somme
        total_restant += activite.restant
    id_tab = 0
    return render(request, 'frontoffice/suivi_budget.html', locals())