# -*- coding: utf-8 -*-
from south.db import db
from south.v2 import SchemaMigration

import datetime


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Adding model 'Langue'
        db.create_table(u'frontoffice_langue', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nom_langue', self.gf('django.db.models.fields.CharField')(max_length=30)),
            ('code_langue', self.gf('django.db.models.fields.CharField')(max_length=5)),
        ))
        db.send_create_signal(u'frontoffice', ['Langue'])

        # Adding model 'Monnaie'
        db.create_table(u'frontoffice_monnaie', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nom_devise', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('signe', self.gf('django.db.models.fields.CharField')(max_length=10)),
        ))
        db.send_create_signal(u'frontoffice', ['Monnaie'])

        # Adding model 'CountriesInfos'
        db.create_table(u'frontoffice_countriesinfos', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('country', self.gf('django.db.models.fields.CharField')(max_length=40)),
            ('complete_name', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('short_name', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('currency', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Monnaie'], max_length=20)),
            ('langue', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Langue'], max_length=25)),
        ))
        db.send_create_signal(u'frontoffice', ['CountriesInfos'])

        # Adding model 'Projet'
        db.create_table(u'frontoffice_projet', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nom_de_code', self.gf('django.db.models.fields.CharField')(max_length=50)),
        ))
        db.send_create_signal(u'frontoffice', ['Projet'])

        # Adding model 'Profile'
        db.create_table(u'frontoffice_profile', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('user', self.gf('django.db.models.fields.related.OneToOneField')(related_name='profile', unique=True, to=orm['auth.User'])),
            ('pays', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.CountriesInfos'])),
            ('projet', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Projet'])),
        ))
        db.send_create_signal(u'frontoffice', ['Profile'])

        # Adding model 'BudgetProjet'
        db.create_table(u'frontoffice_budgetprojet', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('project', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Projet'])),
            ('montantDemande', self.gf('django.db.models.fields.FloatField')(default=0)),
            ('montantAttribue', self.gf('django.db.models.fields.FloatField')(default=0)),
        ))
        db.send_create_signal(u'frontoffice', ['BudgetProjet'])

        # Adding model 'AnneeComptable'
        db.create_table(u'frontoffice_anneecomptable', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('libelle_annee', self.gf('django.db.models.fields.CharField')(max_length=30)),
            ('code_annee', self.gf('django.db.models.fields.CharField')(max_length=10)),
            ('projet', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Projet'])),
            ('etat_annee', self.gf('django.db.models.fields.IntegerField')(max_length=10)),
        ))
        db.send_create_signal(u'frontoffice', ['AnneeComptable'])

        # Adding model 'PlanAnnuel'
        db.create_table(u'frontoffice_planannuel', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('libelle_annee', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('code_annee', self.gf('django.db.models.fields.CharField')(max_length=10)),
            ('budgetProjet', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.BudgetProjet'])),
            ('montant_total_prevu', self.gf('django.db.models.fields.FloatField')(default=0)),
            ('projet', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Projet'])),
            ('annee_comptable', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.AnneeComptable'])),
        ))
        db.send_create_signal(u'frontoffice', ['PlanAnnuel'])

        # Adding model 'Mois'
        db.create_table(u'frontoffice_mois', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('annee', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.AnneeComptable'])),
            ('nom_mois', self.gf('django.db.models.fields.CharField')(max_length=10)),
            ('numero_mois', self.gf('django.db.models.fields.PositiveSmallIntegerField')()),
            ('etat', self.gf('django.db.models.fields.PositiveSmallIntegerField')(max_length=10)),
        ))
        db.send_create_signal(u'frontoffice', ['Mois'])

        # Adding model 'PlanMensuel'
        db.create_table(u'frontoffice_planmensuel', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('mois', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Mois'])),
            ('plan_annuel', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.PlanAnnuel'])),
            ('code', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('libelle', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('projet', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Projet'])),
        ))
        db.send_create_signal(u'frontoffice', ['PlanMensuel'])

        # Adding model 'ElementMensuel'
        db.create_table(u'frontoffice_elementmensuel', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('planmensuel', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.PlanMensuel'])),
            ('code', self.gf('django.db.models.fields.CharField')(max_length=20)),
            ('libelle_element_mensuel', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('montant', self.gf('django.db.models.fields.FloatField')(default=0)),
            ('projet', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Projet'])),
        ))
        db.send_create_signal(u'frontoffice', ['ElementMensuel'])

        # Adding model 'Themes'
        db.create_table(u'frontoffice_themes', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('libelle_theme', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal(u'frontoffice', ['Themes'])

        # Adding model 'ActiviteB'
        db.create_table(u'frontoffice_activiteb', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('theme', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Themes'])),
            ('libelle_activite', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('dateDebut', self.gf('django.db.models.fields.DateField')()),
            ('dateFin', self.gf('django.db.models.fields.DateField')()),
            ('montantPrevu', self.gf('django.db.models.fields.FloatField')(default=0)),
            ('projet', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Projet'])),
        ))
        db.send_create_signal(u'frontoffice', ['ActiviteB'])

        # Adding model 'LigneBudget'
        db.create_table(u'frontoffice_lignebudget', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('activite', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.ActiviteB'])),
            ('elementPlanMensuel', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.ElementMensuel'])),
            ('libelle_ligne', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('montantPrevu', self.gf('django.db.models.fields.FloatField')(default=0)),
            ('projet', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Projet'])),
        ))
        db.send_create_signal(u'frontoffice', ['LigneBudget'])

        # Adding model 'Operation'
        db.create_table(u'frontoffice_operation', (
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('libelle_operation', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('date_operation', self.gf('django.db.models.fields.DateField')()),
            ('somme_operation', self.gf('django.db.models.fields.FloatField')(default=0)),
            ('ligne_budget', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.LigneBudget'])),
            ('memo', self.gf('django.db.models.fields.TextField')()),
            ('projet', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['frontoffice.Projet'])),
            ('soumission', self.gf('django.db.models.fields.PositiveSmallIntegerField')(default=4)),
            ('reference_paiement', self.gf('django.db.models.fields.CharField')(max_length=50)),
        ))
        db.send_create_signal(u'frontoffice', ['Operation'])

        # Adding model 'OperationBancaire'
        db.create_table(u'frontoffice_operationbancaire', (
            ('operation', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['frontoffice.Operation'], unique=True, primary_key=True)),
            ('type_operation_bancaire', self.gf('django.db.models.fields.PositiveSmallIntegerField')()),
            ('reference_operation', self.gf('django.db.models.fields.CharField')(max_length=50)),
        ))
        db.send_create_signal(u'frontoffice', ['OperationBancaire'])

        # Adding model 'OperationCaisse'
        db.create_table(u'frontoffice_operationcaisse', (
            ('operation', self.gf('django.db.models.fields.related.OneToOneField')(to=orm['frontoffice.Operation'], unique=True, primary_key=True)),
            ('numRecu', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal(u'frontoffice', ['OperationCaisse'])


    def backwards(self, orm):
        # Deleting model 'Langue'
        db.delete_table(u'frontoffice_langue')

        # Deleting model 'Monnaie'
        db.delete_table(u'frontoffice_monnaie')

        # Deleting model 'CountriesInfos'
        db.delete_table(u'frontoffice_countriesinfos')

        # Deleting model 'Projet'
        db.delete_table(u'frontoffice_projet')

        # Deleting model 'Profile'
        db.delete_table(u'frontoffice_profile')

        # Deleting model 'BudgetProjet'
        db.delete_table(u'frontoffice_budgetprojet')

        # Deleting model 'AnneeComptable'
        db.delete_table(u'frontoffice_anneecomptable')

        # Deleting model 'PlanAnnuel'
        db.delete_table(u'frontoffice_planannuel')

        # Deleting model 'Mois'
        db.delete_table(u'frontoffice_mois')

        # Deleting model 'PlanMensuel'
        db.delete_table(u'frontoffice_planmensuel')

        # Deleting model 'ElementMensuel'
        db.delete_table(u'frontoffice_elementmensuel')

        # Deleting model 'Themes'
        db.delete_table(u'frontoffice_themes')

        # Deleting model 'ActiviteB'
        db.delete_table(u'frontoffice_activiteb')

        # Deleting model 'LigneBudget'
        db.delete_table(u'frontoffice_lignebudget')

        # Deleting model 'Operation'
        db.delete_table(u'frontoffice_operation')

        # Deleting model 'OperationBancaire'
        db.delete_table(u'frontoffice_operationbancaire')

        # Deleting model 'OperationCaisse'
        db.delete_table(u'frontoffice_operationcaisse')


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
            'libelle_activite': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'montantPrevu': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'projet': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Projet']"}),
            'theme': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Themes']"})
        },
        u'frontoffice.anneecomptable': {
            'Meta': {'object_name': 'AnneeComptable'},
            'code_annee': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'etat_annee': ('django.db.models.fields.IntegerField', [], {'max_length': '10'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_annee': ('django.db.models.fields.CharField', [], {'max_length': '30'}),
            'projet': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Projet']"})
        },
        u'frontoffice.budgetprojet': {
            'Meta': {'object_name': 'BudgetProjet'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'montantAttribue': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'montantDemande': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'project': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Projet']"})
        },
        u'frontoffice.countriesinfos': {
            'Meta': {'object_name': 'CountriesInfos'},
            'complete_name': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'country': ('django.db.models.fields.CharField', [], {'max_length': '40'}),
            'currency': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Monnaie']", 'max_length': '20'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'langue': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Langue']", 'max_length': '25'}),
            'short_name': ('django.db.models.fields.CharField', [], {'max_length': '20'})
        },
        u'frontoffice.elementmensuel': {
            'Meta': {'object_name': 'ElementMensuel'},
            'code': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_element_mensuel': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'montant': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'planmensuel': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.PlanMensuel']"}),
            'projet': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Projet']"})
        },
        u'frontoffice.langue': {
            'Meta': {'object_name': 'Langue'},
            'code_langue': ('django.db.models.fields.CharField', [], {'max_length': '5'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nom_langue': ('django.db.models.fields.CharField', [], {'max_length': '30'})
        },
        u'frontoffice.lignebudget': {
            'Meta': {'object_name': 'LigneBudget'},
            'activite': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.ActiviteB']"}),
            'elementPlanMensuel': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.ElementMensuel']"}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_ligne': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'montantPrevu': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'projet': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Projet']"})
        },
        u'frontoffice.mois': {
            'Meta': {'object_name': 'Mois'},
            'annee': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.AnneeComptable']"}),
            'etat': ('django.db.models.fields.PositiveSmallIntegerField', [], {'max_length': '10'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nom_mois': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'numero_mois': ('django.db.models.fields.PositiveSmallIntegerField', [], {})
        },
        u'frontoffice.monnaie': {
            'Meta': {'object_name': 'Monnaie'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nom_devise': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'signe': ('django.db.models.fields.CharField', [], {'max_length': '10'})
        },
        u'frontoffice.operation': {
            'Meta': {'object_name': 'Operation'},
            'date_operation': ('django.db.models.fields.DateField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_operation': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'ligne_budget': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.LigneBudget']"}),
            'memo': ('django.db.models.fields.TextField', [], {}),
            'projet': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Projet']"}),
            'reference_paiement': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'somme_operation': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'soumission': ('django.db.models.fields.PositiveSmallIntegerField', [], {'default': '4'})
        },
        u'frontoffice.operationbancaire': {
            'Meta': {'object_name': 'OperationBancaire', '_ormbases': [u'frontoffice.Operation']},
            'operation': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['frontoffice.Operation']", 'unique': 'True', 'primary_key': 'True'}),
            'reference_operation': ('django.db.models.fields.CharField', [], {'max_length': '50'}),
            'type_operation_bancaire': ('django.db.models.fields.PositiveSmallIntegerField', [], {})
        },
        u'frontoffice.operationcaisse': {
            'Meta': {'object_name': 'OperationCaisse', '_ormbases': [u'frontoffice.Operation']},
            'numRecu': ('django.db.models.fields.IntegerField', [], {}),
            'operation': ('django.db.models.fields.related.OneToOneField', [], {'to': u"orm['frontoffice.Operation']", 'unique': 'True', 'primary_key': 'True'})
        },
        u'frontoffice.planannuel': {
            'Meta': {'object_name': 'PlanAnnuel'},
            'annee_comptable': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.AnneeComptable']"}),
            'budgetProjet': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.BudgetProjet']"}),
            'code_annee': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_annee': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'montant_total_prevu': ('django.db.models.fields.FloatField', [], {'default': '0'}),
            'projet': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Projet']"})
        },
        u'frontoffice.planmensuel': {
            'Meta': {'object_name': 'PlanMensuel'},
            'code': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'mois': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Mois']"}),
            'plan_annuel': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.PlanAnnuel']"}),
            'projet': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Projet']"})
        },
        u'frontoffice.profile': {
            'Meta': {'object_name': 'Profile'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'pays': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.CountriesInfos']"}),
            'projet': ('django.db.models.fields.related.ForeignKey', [], {'to': u"orm['frontoffice.Projet']"}),
            'user': ('django.db.models.fields.related.OneToOneField', [], {'related_name': "'profile'", 'unique': 'True', 'to': u"orm['auth.User']"})
        },
        u'frontoffice.projet': {
            'Meta': {'object_name': 'Projet'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nom_de_code': ('django.db.models.fields.CharField', [], {'max_length': '50'})
        },
        u'frontoffice.themes': {
            'Meta': {'object_name': 'Themes'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'libelle_theme': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        }
    }

    complete_apps = ['frontoffice']