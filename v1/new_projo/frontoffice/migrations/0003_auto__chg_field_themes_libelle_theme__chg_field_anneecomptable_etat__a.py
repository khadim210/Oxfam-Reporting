# -*- coding: utf-8 -*-
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):

        # Changing field 'Themes.libelle_theme'
        db.alter_column(u'frontoffice_themes', 'libelle_theme', self.gf('django.db.models.fields.CharField')(max_length=20))

        # Changing field 'AnneeComptable.etat'
        db.alter_column(u'frontoffice_anneecomptable', 'etat', self.gf('django.db.models.fields.CharField')(max_length=30))
        # Adding field 'OperationBancaire.somme_operation'
        db.add_column(u'frontoffice_operationbancaire', 'somme_operation',
                      self.gf('django.db.models.fields.IntegerField')(default=0),
                      keep_default=False)


        # Changing field 'ElementMensuel.libelle_element_mensuel'
        db.alter_column(u'frontoffice_elementmensuel', 'libelle_element_mensuel', self.gf('django.db.models.fields.CharField')(max_length=100))

        # Changing field 'ElementMensuel.code'
        db.alter_column(u'frontoffice_elementmensuel', 'code', self.gf('django.db.models.fields.CharField')(max_length=20))

        # Changing field 'BudgetProjet.montantRestant'
        db.alter_column(u'frontoffice_budgetprojet', 'montantRestant', self.gf('django.db.models.fields.IntegerField')())

        # Changing field 'BudgetProjet.montantDemande'
        db.alter_column(u'frontoffice_budgetprojet', 'montantDemande', self.gf('django.db.models.fields.IntegerField')())

        # Changing field 'BudgetProjet.montantAttribue'
        db.alter_column(u'frontoffice_budgetprojet', 'montantAttribue', self.gf('django.db.models.fields.IntegerField')())

        # Changing field 'BudgetProjet.montantExecute'
        db.alter_column(u'frontoffice_budgetprojet', 'montantExecute', self.gf('django.db.models.fields.IntegerField')())
        # Adding field 'OperationCaisse.somme_operation'
        db.add_column(u'frontoffice_operationcaisse', 'somme_operation',
                      self.gf('django.db.models.fields.IntegerField')(default=0),
                      keep_default=False)


        # Changing field 'ActiviteB.montantPrevu'
        db.alter_column(u'frontoffice_activiteb', 'montantPrevu', self.gf('django.db.models.fields.IntegerField')())

        # Changing field 'PlanMensuel.code'
        db.alter_column(u'frontoffice_planmensuel', 'code', self.gf('django.db.models.fields.CharField')(max_length=20))

        # Changing field 'PlanMensuel.libelle'
        db.alter_column(u'frontoffice_planmensuel', 'libelle', self.gf('django.db.models.fields.CharField')(max_length=100))

    def backwards(self, orm):

        # Changing field 'Themes.libelle_theme'
        db.alter_column(u'frontoffice_themes', 'libelle_theme', self.gf('django.db.models.fields.CharField')(max_length=10))

        # Changing field 'AnneeComptable.etat'
        db.alter_column(u'frontoffice_anneecomptable', 'etat', self.gf('django.db.models.fields.CharField')(max_length=10))
        # Deleting field 'OperationBancaire.somme_operation'
        db.delete_column(u'frontoffice_operationbancaire', 'somme_operation')


        # Changing field 'ElementMensuel.libelle_element_mensuel'
        db.alter_column(u'frontoffice_elementmensuel', 'libelle_element_mensuel', self.gf('django.db.models.fields.CharField')(max_length=10))

        # Changing field 'ElementMensuel.code'
        db.alter_column(u'frontoffice_elementmensuel', 'code', self.gf('django.db.models.fields.CharField')(max_length=10))

        # Changing field 'BudgetProjet.montantRestant'
        db.alter_column(u'frontoffice_budgetprojet', 'montantRestant', self.gf('django.db.models.fields.FloatField')())

        # Changing field 'BudgetProjet.montantDemande'
        db.alter_column(u'frontoffice_budgetprojet', 'montantDemande', self.gf('django.db.models.fields.FloatField')())

        # Changing field 'BudgetProjet.montantAttribue'
        db.alter_column(u'frontoffice_budgetprojet', 'montantAttribue', self.gf('django.db.models.fields.FloatField')())

        # Changing field 'BudgetProjet.montantExecute'
        db.alter_column(u'frontoffice_budgetprojet', 'montantExecute', self.gf('django.db.models.fields.FloatField')())
        # Deleting field 'OperationCaisse.somme_operation'
        db.delete_column(u'frontoffice_operationcaisse', 'somme_operation')


        # Changing field 'ActiviteB.montantPrevu'
        db.alter_column(u'frontoffice_activiteb', 'montantPrevu', self.gf('django.db.models.fields.FloatField')())

        # Changing field 'PlanMensuel.code'
        db.alter_column(u'frontoffice_planmensuel', 'code', self.gf('django.db.models.fields.CharField')(max_length=10))

        # Changing field 'PlanMensuel.libelle'
        db.alter_column(u'frontoffice_planmensuel', 'libelle', self.gf('django.db.models.fields.CharField')(max_length=10))

    models = {
        u'auth.group': {
            'Meta': {'object_name': 'Group'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '80'}),
            'permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'})
        },
        u'auth.permission': {
            'Meta': {'ordering': "(u'content_type__app_label', u'content_type__model', u'codename')", 'unique_together': "((u'content_type', u'codename'),)", 'object_name': 'Permission'},
            'codename': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'content_type': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['contenttypes.ContentType']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'auth.user': {
            'Meta': {'object_name': 'User'},
            'date_joined': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'blank': 'True'}),
            'first_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'groups': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['auth.Group']", 'symmetrical': 'False', 'blank': 'True'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'is_active': ('django.db.models.fields.BooleanField', [], {'default': 'True'}),
            'is_staff': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'is_superuser': ('django.db.models.fields.BooleanField', [], {'default': 'False'}),
            'last_login': ('django.db.models.fields.DateTimeField', [], {'default': 'datetime.datetime.now'}),
            'last_name': ('django.db.models.fields.CharField', [], {'max_length': '30', 'blank': 'True'}),
            'password': ('django.db.models.fields.CharField', [], {'max_length': '128'}),
            'user_permissions': ('django.db.models.fields.related.ManyToManyField', [], {'to': u"orm['auth.Permission']", 'symmetrical': 'False', 'blank': 'True'}),
            'username': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '30'})
        },
        u'contenttypes.contenttype': {
            'Meta': {'ordering': "('name',)", 'unique_together': "(('app_label', 'model'),)", 'object_name': 'ContentType', 'db_table': "'django_content_type'"},
            'app_label': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'model': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
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
        u'frontoffice.profile': {
            'Meta': {'object_name': 'Profile'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'user': ('django.db.models.fields.related.OneToOneField', [], {'related_name': "'profile'", 'unique': 'True', 'to': u"orm['auth.User']"})
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