#-*-coding:utf-8-*
__author__ = 'nmtsylla'

from django import forms
from django.forms import ModelForm

from frontoffice.models import ActiviteB, OperationCaisse, OperationBancaire, Profile


class ProfileForm(ModelForm):
    username = forms.CharField(label=u"Nom d'utilisateur")
    email = forms.EmailField(label=u'Adresse email')
    password = forms.CharField(label=u'Mot de passe', widget=forms.PasswordInput(render_value=False))
    password1 = forms.CharField(label=u'Confirme mot de passe', widget=forms.PasswordInput(render_value=False))

    class Meta:
        model = Profile
        exclude = 'user'


class ActiviteBForm():
    class Meta:
        model = ActiviteB


class OperationCaisseForm(forms.ModelForm):

    class Meta:
        model = OperationCaisse
        exclude = ('ligne_budget', 'soumission', 'operation', 'projet')


class OperationBancaireForm(forms.ModelForm):

    class Meta:
        model = OperationBancaire
        exclude = ('ligne_budget', 'soumission', 'operation', 'projet')