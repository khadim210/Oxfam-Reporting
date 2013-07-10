# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'Profile'
        db.delete_table(u'frontoffice_profile')


    def backwards(self, orm):
        # Adding model 'Profile'
        db.create_table(u'frontoffice_profile', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.OneToOneField')(related_name='profile', unique=True, to=orm['auth.User'])),
        ))
        db.send_create_signal(u'frontoffice', ['Profile'])


    models = {
        u'frontoffice.activiteb': {
            'Meta': {'object_name': 'ActiviteB'},
            'dateDebut': ('django.db.models.fields.DateField', [], {}),
            'dateFin': ('django.db.models.fields.DateField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'montantPrevu': ('django.db.models.fields.IntegerField', [], {}),
            'theme': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Themes']"})
        },
        u'frontoffice.anneecomptable': {
            'Meta': {'object_name': 'AnneeComptable'},
            'code_annee': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'etat': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_annee': ('django.db.models.fields.CharField', [], {'max_length': '10'})
        },
        u'frontoffice.budgetprojet': {
            'Meta': {'object_name': 'BudgetProjet'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'montantAttribue': ('django.db.models.fields.IntegerField', [], {}),
            'montantDemande': ('django.db.models.fields.IntegerField', [], {}),
            'montantExecute': ('django.db.models.fields.IntegerField', [], {}),
            'montantRestant': ('django.db.models.fields.IntegerField', [], {}),
            'project': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['frontoffice.Projet']", 'unique': 'True'})
        },
        u'frontoffice.elementmensuel': {
            'Meta': {'object_name': 'ElementMensuel'},
            'code': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_element_mensuel': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'montant': ('django.db.models.fields.FloatField', [], {}),
            'planmensuel': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.PlanMensuel']"})
        },
        u'frontoffice.lignebudget': {
            'Meta': {'object_name': 'LigneBudget'},
            'activite': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.ActiviteB']"}),
            'elementPlanMensuel': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.ElementMensuel']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_ligne': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'montantExecute': ('django.db.models.fields.IntegerField', [], {}),
            'montantPrevu': ('django.db.models.fields.IntegerField', [], {})
        },
        u'frontoffice.mois': {
            'Meta': {'object_name': 'Mois'},
            'annee': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.AnneeComptable']"}),
            'code_mois': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_mois': ('django.db.models.fields.CharField', [], {'max_length': '10'})
        },
        u'frontoffice.operationbancaire': {
            'Meta': {'object_name': 'OperationBancaire'},
            'date_operation': ('django.db.models.fields.DateField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_operation': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'ligne_budget': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.LigneBudget']"}),
            'memo': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'reference_operation': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'reference_paiement': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'somme_operation': ('django.db.models.fields.IntegerField', [], {'default': '0'}),
            'type_operation': ('django.db.models.fields.CharField', [], {'max_length': '10'})
        },
        u'frontoffice.operationcaisse': {
            'Meta': {'object_name': 'OperationCaisse'},
            'date_operation': ('django.db.models.fields.DateField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_operation': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'ligne_budget': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.LigneBudget']"}),
            'memo': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'numRecu': ('django.db.models.fields.IntegerField', [], {}),
            'reference_paiement': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'somme_operation': ('django.db.models.fields.IntegerField', [], {'default': '0'})
        },
        u'frontoffice.planannuel': {
            'Meta': {'object_name': 'PlanAnnuel'},
            'budgetProjet': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['frontoffice.BudgetProjet']", 'unique': 'True'}),
            'code_annee': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_annee': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'montant_total_prevu': ('django.db.models.fields.IntegerField', [], {})
        },
        u'frontoffice.planmensuel': {
            'Meta': {'object_name': 'PlanMensuel'},
            'annee_comptable': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.PlanAnnuel']"}),
            'code': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'mois': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Mois']"})
        },
        u'frontoffice.projet': {
            'Meta': {'object_name': 'Projet'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nom_de_code': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'frontoffice.themes': {
            'Meta': {'object_name': 'Themes'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_theme': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        }
    }

    complete_apps = ['frontoffice']