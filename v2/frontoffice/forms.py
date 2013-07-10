#-*-coding:utf-8-*
__author__ = 'nmtsylla'

from django import forms
from frontoffice.models import Operation, ActiviteB, OperationCaisse, OperationBancaire
from django.utils.translation import gettext_lazy as _


class ActiviteBForm():
    class Meta:
        model = ActiviteB


class OperationCaisseForm(forms.ModelForm):

    class Meta:
        model = OperationCaisse
        exclude = ('ligne_budget', 'soumission', 'operation')


class OperationBancaireForm(forms.ModelForm):

    class Meta:
        model = OperationBancaire
        exclude = ('ligne_budget', 'soumission', 'operation')