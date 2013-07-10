# Create your views here.

from django.shortcuts import render
from django.core.context_processors import csrf
from django.contrib import auth
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from frontoffice.models import ActiviteB, Operation, LigneBudget, Themes
from frontoffice.forms import OperationForm, ActiviteBForm
from django.utils.translation import gettext_lazy as _
import datetime


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
    operation = Operation.objects.all().order_by('-date_operation')[:5]
    return render(request, 'frontoffice/tableau_de_bord.html', locals())


def deconnexion(request):
    #request.session = {}
    auth.logout(request)
    return HttpResponseRedirect('/')

@login_required(login_url=login)
def gestion_op(request):
    operation = Operation.objects.all().order_by('-date_operation')
    id_tab = 0
    themes = []
    for op in operation:
        if op.ligne_budget.activite not in themes:
            themes.append(op.ligne_budget.activite)
    # operation_ = OperationCaisse.objects.all().order_by('-date_operation')
    # total_execute = 0
    # restant = {}
    # for i in OperationCaisse.objects.all():
    #     total_execute += i.somme_operation
    #
    # for i in OperationBancaire.objects.all():
    #     total_execute += i.somme_operation
    # #caisse = OperationBancaire.ligne_budget.montantPrevu
    # caisse = LigneBudget.objects.get(id=1).montantPrevu
    # montant_restant = caisse - total_execute
    # lignes_budget = LigneBudget.objects.all()
    return render(request, 'frontoffice/gestion_operation.html', locals())


def add_caisse_op(request):
    themes = Themes.objects.all()
    lignes_budget = LigneBudget.objects.all()
    restant = []
    for l in lignes_budget:
        restant.append(l.montantPrevu - l.montantExecute)
    if request.POST:
        form = OperationForm(request.POST)
        if form.is_valid():
            op = form.save(commit=False)
            ligne = request.POST.get('ligne_budget_id', '')
            l_budget = LigneBudget.objects.get(libelle_ligne=ligne)
            op.ligne_budget = l_budget
            op.save()
            return render(request, 'frontoffice/gestion_operation.html')
    else:
        form = OperationForm()
    args = {}
    args.update(csrf(request))
    args['form'] = form
    args['lignes_budget'] = lignes_budget
    args['themes'] = themes
    return render(request, 'frontoffice/ajouter_op_banque.html', locals())

@login_required(login_url=login)
def statistique(request):
    return render(request, 'frontoffice/statistiques.html')

@login_required(login_url=login)
def suivi_budget(request):
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