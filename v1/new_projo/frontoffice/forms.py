__author__ = 'nmtsylla'

from django import forms
from frontoffice.models import Operation, ActiviteB
from django.utils.translation import gettext_lazy as _


class ActiviteBForm():
    class Meta:
        model = ActiviteB


class OperationForm(forms.ModelForm):
    date_operation = forms.DateField()
    memo = forms.TextInput()

    class Meta:
        model = Operation
        exclude = ('ligne_budget', 'soumission')
