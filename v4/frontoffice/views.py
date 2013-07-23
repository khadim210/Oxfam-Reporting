#-*-coding:utf-8
# Create your views here.

import json
from datetime import datetime

from django.core.context_processors import csrf
from django.contrib import auth
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required
from django.core.exceptions import ObjectDoesNotExist
from django.db import connection
from django.http import HttpResponseRedirect, HttpResponse
from django.shortcuts import render
from django.utils.translation import gettext_lazy as _

from frontoffice.models import ActiviteB, Operation, LigneBudget, Themes, Profile
from frontoffice.forms import OperationCaisseForm, OperationBancaireForm, ProfileForm


def pourcentage_mois():
    return Operation.my_objects.pourcentage_mois()


def addProfile(request):
    if request.user.is_authenticated():
        return HttpResponseRedirect('/homepage')
    if request.method == 'POST':
        form = ProfileForm(request.POST)
        if form.is_valid():
            user = User.objects.create_user(username=form.cleaned_data['username'], email=form.cleaned_data['email'],
                                            password=form.cleaned_data['password'])
            user.save()
            #profile = user.get_profile()
            profile = Profile(user=user, pays=form.cleaned_data['pays'], projet=form.cleaned_data['projet'])
            profile.save()
            return HttpResponseRedirect('/homepage')
        else:
            return render(request, 'frontoffice/new_profile.html', locals())
    else:
        form = ProfileForm()
    form = form
    return render(request, 'frontoffice/new_profile.html', locals())


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
        request.session['projet_id'] = user.profile.projet.id
        request.session['pourcentage'] = pourcentage_mois()
        request.session.modified = True
        return HttpResponseRedirect('/homepage', locals())
    else:
        return HttpResponseRedirect('/')


@login_required(login_url=login)
def homepage(request):
    the_title = _('Accueil')
    operation = Operation.objects.raw("SELECT a.id, a.libelle_operation, a.date_operation, "
                                      "a.somme_operation, b.libelle_ligne "
                                      "FROM frontoffice_operation a, frontoffice_lignebudget b "
                                      "WHERE a.ligne_budget_id=b.id order by a.date_operation DESC LIMIT 5")
    return render(request, 'frontoffice/tableau_de_bord.html', locals())


def deconnexion(request):
    try:
        auth.logout(request)
        del request.session
    except KeyError:
        pass
    return HttpResponseRedirect('/')


@login_required(login_url=login)
def gestion_op(request):
    the_title = _('Gestion operation')
    soumission = [_('Validee'), _('Soumise'), 'Rejettee', _('Brouillon')]
    pcentage_global = Operation.my_objects.pourcentage_global()
    pcentage_mois = pourcentage_mois()
    pcentage_semestre = Operation.my_objects.pourcentage_semestre()
    opp_sql = Operation.my_objects.operations_details()
    themes, date_op = [], []
    month_name = [_("Janvier"), _("Fevrier"), _("Mars"), _("Avril"), _("Mai"), _("Juin"), _("Juillet"), _("Aout"),
                  _("Septembre"), _("Octobre"), _("Novembre"), _("Decembre")]
    for op in opp_sql:
        if op.libelle_theme not in themes:
            themes.append(op.libelle_theme)
        if op.date_operation.month not in date_op:
            date_op.append(op.date_operation.month)
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
    lignes, dict_act, data = [], [], []
    #lignes = LigneBudget.objects.filter(activite_id=activite_id)
    try:
        lignes = LigneBudget.objects.filter(activite_id=activite_id)
        for l in lignes:
            dict_act.append({'id': l.id, 'libelle': l.libelle_ligne, 'restant': l.montantPrevu})
        data = json.dumps(dict_act)
    except ObjectDoesNotExist:
        pass
    return HttpResponse(data, content_type="text/json")


@login_required(login_url=login)
def add_caisse_op(request):
    the_title = _('Ajouter operation caisse')
    themes = Themes.my_objects.all()
    type_op = 'caisse'
    if request.POST:
        form1 = OperationCaisseForm(request.POST)
        if form1.is_valid():
            op = form1.save(commit=False)
            ligne = request.POST.get('ligne', '')
            op.ligne_budget_id = ligne
            op.soumission = 4
            op.projet_id = request.session['projet_id']
            op.save()
            request.session['pourcentage'] = pourcentage_mois()
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
    themes = Themes.my_objects.all()
    if request.POST:
        form1 = OperationBancaireForm(request.POST)
        if form1.is_valid():
            op = form1.save(commit=False)
            ligne = request.POST.get('ligne', '')
            op.ligne_budget_id = ligne
            op.soumission = 4
            op.projet_id = request.session['projet_id']
            op.save()
            request.session['pourcentage'] = pourcentage_mois()
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
    themes = Themes.objet.details()
    activites = ActiviteB.objects.details()
    #id_tab = 0
    return render(request, 'frontoffice/suivi_budget.html', locals())


@login_required(login_url=login)
def soumettre(request):
    try:
        Operation.objects.filter(soumission=4, projet_id=request.session['projet_id']).update(soumission=2)
    except ObjectDoesNotExist:
        return HttpResponse('Erreur soumission données')
    return HttpResponseRedirect('/gestion_operation')


def detail_operation(request, id_operation):
    try:
        operation = Operation.objects.get(id=id_operation)
    except Operation.DoesNotExist:
        pass
    return render(request, 'frontoffice/detail_op.html', locals())


def delete_operation(request):
    id_operation = request.POST['id_operation']
    data = {}
    result = True
    try:
        operation = Operation.objects.get(id=id_operation)
        operation.delete()
    except ObjectDoesNotExist:
        result = False
    data['resultat'] = result
    return HttpResponse(data, content_type="text/json")


def depense_par_mois(request):
    resultat, dict_data = [], []
    try:
        cursor = connection.cursor()
        cursor.execute("SELECT sum(somme_operation), month(date_operation) "
                       "FROM frontoffice_operation group by month(date_operation)")
        for row in cursor.fetchall():
            dict_data.append({'Value': row[0], 'Date': row[1]})
        resultat = json.dumps(dict_data)
    except Exception:
        pass
    return HttpResponse(resultat, content_type="text/json")