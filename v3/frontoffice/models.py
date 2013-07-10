#-*-coding:utf-8
from django.db import models, connection
from django.utils.translation import gettext_lazy as _

# Create your models here.

from django.contrib.auth.models import User


class Langue(models.Model):
    nom_langue = models.CharField(max_length=30, verbose_name=_('Nom langue'))
    code_langue = models.CharField(max_length=5, verbose_name=_('Code langue'))

    def __unicode__(self):
        return "%s" % self.code_langue


class Monnaie(models.Model):
    nom_devise = models.CharField(max_length=20, verbose_name=_('Monnaie'))
    signe = models.CharField(verbose_name=_('Signe monnaie'), max_length=10)

    def __unicode__(self):
        return "%s" % self.nom_devise


class CountriesInfos(models.Model):
    country = models.CharField(max_length=30, verbose_name=_('Pays'))
    complete_name = models.CharField(max_length=100, verbose_name=_('Nom complet'))
    short_name = models.CharField(max_length=20, verbose_name=_('Nom court'))
    currency = models.ForeignKey(Monnaie, verbose_name=_('Monnaie'), max_length=10)
    langue = models.ForeignKey(Langue, verbose_name=_('Langue'), max_length=15)

    def __unicode__(self):
        return "%s" % self.country


class Profile(models.Model):
    user = models.OneToOneField(User, related_name="profile", verbose_name=_("user"))
    pays = models.ForeignKey(CountriesInfos, verbose_name=_('Pays'))

    def __unicode__(self):
        return "%s" % self.user.username

User.profile = property(lambda u: Profile.objects.get_or_create(user=u)[0])


class Projet(models.Model):
    nom_de_code = models.CharField(max_length=30, verbose_name=_("Projet"))

    def __unicode__(self):
        return "%s" % self.nom_de_code


class BudgetProjet(models.Model):
    project = models.OneToOneField(Projet)
    montantDemande = models.IntegerField(verbose_name=_('Montant demandé'))
    montantAttribue = models.IntegerField(verbose_name=_("Montant attribué"))
    montantExecute = models.IntegerField(verbose_name=_("Montant exécuté"))
    montantRestant = models.IntegerField(verbose_name=_("Montant réstant"))

    def __unicode__(self):
        return "%s" % self.montantDemande


class AnneeComptable(models.Model):
    libelle_annee = models.CharField(max_length=30, verbose_name=_('Année comptable'))
    code_annee = models.CharField(max_length=10, verbose_name=_('Code année'))
    etats = (
        ('cloturée', 'cloturée'),
        ('ouverte', 'ouverte')
    )
    etat = models.CharField(choices=etats, max_length=10, verbose_name=_("Etat de l'année"))

    def __unicode__(self):
        return "%s" % self.libelle_annee


class PlanAnnuel(models.Model):
    libelle_annee = models.CharField(max_length=20, verbose_name=_("Plan année"))
    code_annee = models.CharField(max_length=10, verbose_name=_('Code année'))
    budgetProjet = models.OneToOneField(BudgetProjet)
    montant_total_prevu = models.IntegerField(verbose_name=_("Montant total prévu"))

    def __unicode__(self):
        return "%s" % self.libelle_annee


class Mois(models.Model):
    annee = models.ForeignKey(AnneeComptable)
    code_mois = models.CharField(max_length=10, verbose_name=_("Code mois"))
    libelle_mois = models.CharField(max_length=20, verbose_name=_("Mois"))
    etats = (
        (_('cloturé'), 'cloturé'),
        (_('ouvert'), 'ouvert')
    )
    etat = models.CharField(choices=etats, max_length=10, verbose_name=_("Etat du mois"))

    def __unicode__(self):
        return "%s" % self.libelle_mois


class PlanMensuel(models.Model):
    mois = models.ForeignKey(Mois)
    annee_comptable = models.ForeignKey(PlanAnnuel)
    code = models.CharField(max_length=20, verbose_name=_("Code plan mensuel"))
    libelle = models.CharField(max_length=100, verbose_name=_('Plan mensuel'))

    def __unicode__(self):
        return "%s" % self.libelle


class ElementMensuel(models.Model):
    planmensuel = models.ForeignKey(PlanMensuel)
    code = models.CharField(max_length=20, verbose_name=_("Code element mensuel"))
    libelle_element_mensuel = models.CharField(max_length=100, verbose_name=_('Element mensuel'))
    montant = models.FloatField(verbose_name=_("Montant"))

    def __unicode__(self):
        return "%s" % self.libelle_element_mensuel


class Themes(models.Model):
    libelle_theme = models.CharField(max_length=100, verbose_name=_('Théme'))

    def __unicode__(self):
        return "%s" % self.libelle_theme


class ActiviteB(models.Model):
    theme = models.ForeignKey(Themes)
    libelle_activite = models.CharField(max_length=100, verbose_name=_('Activité'))
    dateDebut = models.DateField(verbose_name=_("Date début activité"))
    dateFin = models.DateField(verbose_name=_("Date fin opération"))
    montantPrevu = models.IntegerField(verbose_name=_("Montant prévu"))

    def __unicode__(self):
        return "%s" % self.libelle_activite


class LigneBudgetManager(models.Manager):
    def montantExecute(self):
        cursor = connection.cursor()
        cursor.execute("""
            SELECT sum(a.somme_operation) as montantExecute
            FROM frontoffice_operation a, frontoffice_lignebudget b
            WHERE a.ligne_budget_id=b.id group by b.id""",)
        return cursor.fetchone()
        #return [row[0] for row in cursor.fetchone()]


class LigneBudget(models.Model):
    activite = models.ForeignKey(ActiviteB)
    elementPlanMensuel = models.ForeignKey(ElementMensuel)
    libelle_ligne = models.CharField(max_length=100, verbose_name=_('Ligne budgetaire'))
    montantPrevu = models.IntegerField(verbose_name=_("Montant prévu"))
    #montantExecute = models.IntegerField(verbose_name=_("Montant exécuté"))
    objects = LigneBudgetManager()

    def __unicode__(self):
        return "%s" % self.libelle_ligne


class Operation(models.Model):
    libelle_operation = models.CharField(max_length=100, verbose_name=_('Opération'))
    date_operation = models.DateField(verbose_name=_("Date opération"))
    somme_operation = models.IntegerField(verbose_name=_('Montant opération'))
    ligne_budget = models.ForeignKey(LigneBudget)
    memo = models.CharField(max_length=100, verbose_name=_("Note"))
    etat_soumission = (
        (_('Validée'), _('Validée')),
        (_('Soumise'), _('Soumise')),
        (_('Rejettée'), _('Rejettée')),
        (_('Brouillon'), _('Brouillon'))
    )
    soumission = models.CharField(max_length=20, verbose_name=_("Etat soumission"), choices=etat_soumission,
                                  default=_('Brouillon'))
    reference_paiement = models.CharField(max_length=50, verbose_name=_('Reférence paiement'))

    def __unicode__(self):
        return "%s" % self.libelle_operation


class OperationBancaire(Operation):
    operation = models.OneToOneField(Operation)
    opp = (
        (_('Virement'), _('Virement')),
        (_('Cheque'), _('Cheque'))
    )
    type_operation_bancaire = models.CharField(choices=opp, max_length=10, verbose_name=_("Type d'opération bancaire"))
    reference_operation = models.CharField(max_length=50, verbose_name=_("Référence de l'opération"))

    def __unicode__(self):
        return "%s" % self.operation


class OperationCaisse(Operation):
    operation = models.OneToOneField(Operation)
    numRecu = models.IntegerField(verbose_name=_("Numéro reçu"))

    def __unicode__(self):
        return "%s" % self.numRecu