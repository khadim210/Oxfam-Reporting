#-*-coding:utf-8
from django.contrib import admin
from frontoffice.models import *
from django.utils.translation import gettext_lazy as _

admin.site.register(ActiviteB)
admin.site.register(BudgetProjet)
admin.site.register(AnneeComptable)
admin.site.register(ElementMensuel)
admin.site.register(LigneBudget)
admin.site.register(Projet)
admin.site.register(PlanMensuel)
admin.site.register(Langue)
admin.site.register(Monnaie)
admin.site.register(Mois)
admin.site.register(CountriesInfos)
admin.site.register(PlanAnnuel)
admin.site.register(Themes)
admin.site.register(Operation)
admin.site.register(Profile)

