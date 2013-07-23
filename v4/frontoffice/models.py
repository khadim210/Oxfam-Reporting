#-*-coding:utf-8

from django.contrib.auth.models import User
from django.db import models, connection
from django.utils.translation import gettext_lazy as _
from django.core.exceptions import ObjectDoesNotExist

from datetime import datetime


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
    country = models.CharField(max_length=40, verbose_name=_('Pays'))
    complete_name = models.CharField(max_length=100, verbose_name=_('Nom complet'))
    short_name = models.CharField(max_length=20, verbose_name=_('Nom court'))
    currency = models.ForeignKey(Monnaie, verbose_name=_('Monnaie'), max_length=20)
    langue = models.ForeignKey(Langue, verbose_name=_('Langue'), max_length=25)

    class Meta:
        verbose_name = _('Country informations')
        verbose_name_plural = _('Countries informations')

    def __unicode__(self):
        return "%s" % self.country


class Projet(models.Model):
    nom_de_code = models.CharField(max_length=50, verbose_name=_("Projet"))

    def __unicode__(self):
        return "%s" % self.nom_de_code


class Profile(models.Model):
    user = models.OneToOneField(User, related_name="profile", verbose_name=_("user"))
    pays = models.ForeignKey(CountriesInfos, verbose_name=_('Pays'))
    projet = models.ForeignKey(Projet, verbose_name=_('Projet'))

    class Meta:
        verbose_name = _('Utilisateur')
        verbose_name_plural = _('Utilisateurs')

    def __unicode__(self):
        return "%s" % self.user.username


User.profile = property(lambda u: Profile.objects.get_or_create(user=u)[0])


class BudgetProjet(models.Model):
    project = models.ForeignKey(Projet)
    montantDemande = models.FloatField(verbose_name=_('Montant demandé'), default=0)
    montantAttribue = models.FloatField(verbose_name=_("Montant attribué"), default=0)

    class Meta:
        verbose_name = _('Budget projet')
        verbose_name_plural = _('Budgets projets')

    def __unicode__(self):
        return "Budget du projet %s" % self.project


class AnneeComptable(models.Model):
    libelle_annee = models.CharField(max_length=30, verbose_name=_('Année comptable'))
    code_annee = models.CharField(max_length=10, verbose_name=_('Code année'), blank=True)
    projet = models.ForeignKey(Projet)
    etats = (
        (0, 'Cloturée'),
        (1, 'Ouverte')
    )
    etat_annee = models.IntegerField(choices=etats, max_length=10, verbose_name=_("Etat de l'année"))

    def __unicode__(self):
        return "%s" % self.libelle_annee


class PlanAnnuel(models.Model):
    libelle_annee = models.CharField(max_length=20, verbose_name=_("Plan année"))
    code_annee = models.CharField(max_length=10, verbose_name=_('Code année'))
    budgetProjet = models.ForeignKey(BudgetProjet)
    montant_total_prevu = models.FloatField(verbose_name=_("Montant total prévu"), default=0)
    projet = models.ForeignKey(Projet)
    annee_comptable = models.ForeignKey(AnneeComptable)

    def __unicode__(self):
        return "%s" % self.libelle_annee


class Mois(models.Model):
    annee = models.ForeignKey(AnneeComptable)
    taux_de_change = models.FloatField(blank=True)
    nom = (
        (_('Janvier'), _('Janvier')),
        (_('Fevrier'), _('Fevrier')),
        (_('Mars'), _('Mars')),
        (_('Avril'), _('Avril')),
        (_('Mai'), _('Mai')),
        (_('Juin'), _('Juin')),
        (_('Juillet'), _('Juillet')),
        (_('Aout'), _('Aout')),
        (_('Septembre'), _('Septembre')),
        (_('Octobre'), _('Octobre')),
        (_('Novembre'), _('Novembre')),
        (_('Decembre'), _('Decembre'))
    )
    nom_mois = models.CharField(choices=nom, verbose_name=_("Mois de"), max_length=10)
    n_mois = ((1, 1), (2, 2), (3, 3), (4, 4), (5, 5), (6, 6),
              (7, 7), (8, 8), (9, 9), (10, 10), (11, 11), (12, 12)
    )
    numero_mois = models.PositiveSmallIntegerField(choices=n_mois, verbose_name=_('Numéro mois (1-12)'))
    etats = (
        (0, _('Cloturé')),
        (1, _('Ouvert'))
    )
    etat = models.PositiveSmallIntegerField(choices=etats, max_length=10, verbose_name=_("Etat du mois"))

    class Meta:
        verbose_name = _('Mois')
        verbose_name_plural = _('Mois')

    def __unicode__(self):
        return "%s" % self.nom_mois


class PlanMensuel(models.Model):
    mois = models.ForeignKey(Mois)
    plan_annuel = models.ForeignKey(PlanAnnuel)
    code = models.CharField(max_length=20, verbose_name=_("Code plan mensuel"), blank=True)
    libelle = models.CharField(max_length=100, verbose_name=_('Plan mensuel'), blank=True)
    projet = models.ForeignKey(Projet)

    def __unicode__(self):
        return "%s" % self.libelle


class ElementMensuel(models.Model):
    planmensuel = models.ForeignKey(PlanMensuel)
    code = models.CharField(max_length=20, verbose_name=_("Code element mensuel"), blank=True)
    libelle_element_mensuel = models.CharField(max_length=100, verbose_name=_('Element mensuel'))
    montant = models.FloatField(verbose_name=_("Montant"), default=0)
    projet = models.ForeignKey(Projet)

    def __unicode__(self):
        return "%s" % self.libelle_element_mensuel


class ThemeManager(models.Manager):
    def details(self):
        cursor = connection.cursor()
        cursor.execute("SELECT a.id, a.libelle_theme, sum(d.somme_operation), sum(b.montantPrevu), "
                       "((sum(d.somme_operation)*100)/sum(b.montantPrevu))"
                       "FROM frontoffice_themes a, frontoffice_activiteb b, frontoffice_lignebudget c, "
                       "frontoffice_operation d "
                       "WHERE b.theme_id=a.id and c.activite_id=b.id and d.ligne_budget_id=c.id group by a.id")
        resultat = []
        for row in cursor.fetchall():
            r = {'id': row[0], 'libelle': row[1], 'montantExecute': row[2], 'montantPrevu': row[3],
                 'montantRestant': row[3] - row[2], 'pourcentage': round(row[4], 2)}
            resultat.append(r)
        return resultat


class Themes(models.Model):
    libelle_theme = models.CharField(max_length=100, verbose_name=_('Théme'))
    objet = models.Manager()
    my_objects = ThemeManager()

    class Meta:
        verbose_name = _('Theme')
        verbose_name_plural = _('Themes')

    def __unicode__(self):
        return "%s" % self.libelle_theme


class ActiviteManager(models.Manager):
    def details(self):
        cursor = connection.cursor()
        cursor.execute("SELECT c.id, c.libelle_activite, sum(a.somme_operation),  c.montantPrevu, "
                       "(sum(a.somme_operation)*100/c.montantPrevu) "
                       "FROM frontoffice_operation a, frontoffice_lignebudget b, frontoffice_activiteb c "
                       "WHERE a.ligne_budget_id=b.id AND b.activite_id=c.id group by c.id")
        det = []
        for row in cursor.fetchall():
            r = {'id': row[0], 'libelle': row[1], 'montantExecute': row[2], 'montantPrevu': row[3],
                 'montantRestant': row[3] - row[2], 'pourcentage': round(row[4], 2)}
            det.append(r)
        return det


class ActiviteB(models.Model):
    theme = models.ForeignKey(Themes)
    libelle_activite = models.CharField(max_length=100, verbose_name=_('Activité'))
    dateDebut = models.DateField(verbose_name=_("Date début activité"))
    dateFin = models.DateField(verbose_name=_("Date fin opération"))
    montantPrevu = models.FloatField(verbose_name=_("Montant prévu"), default=0)
    projet = models.ForeignKey(Projet)
    objects = models.Manager()
    my_objects = ActiviteManager()

    class Meta:
        verbose_name = _('Activite')
        verbose_name_plural = _('Activites')

    def __unicode__(self):
        return "%s" % self.libelle_activite


class LigneBudgetManager(models.Manager):
    def montantExecute(self, id_ligne):
        cursor = connection.cursor()
        cursor.execute("""
            SELECT sum(a.somme_operation)
            FROM frontoffice_operation a, frontoffice_lignebudget b
            WHERE a.ligne_budget_id=b.id AND b.id=%s""", id_ligne)
        return cursor.fetchone()


class LigneBudget(models.Model):
    activite = models.ForeignKey(ActiviteB)
    elementPlanMensuel = models.ForeignKey(ElementMensuel)
    libelle_ligne = models.CharField(max_length=100, verbose_name=_('Ligne budgetaire'))
    montantPrevu = models.FloatField(verbose_name=_("Montant prévu"), default=0)
    projet = models.ForeignKey(Projet)
    objects = LigneBudgetManager()

    class Meta:
        verbose_name = _('Ligne budget')
        verbose_name_plural = _('Lignes budgets')

    def __unicode__(self):
        return "%s" % self.libelle_ligne


class OperationManager(models.Manager):
    def operations_details(self):
        operations = []
        try:
            operations = Operation.objects.raw('SELECT a.id, a.date_operation, month(a.date_operation), '
                                               'a.somme_operation, b.libelle_ligne, c.libelle_activite, d.libelle_theme '
                                               'as libelle_theme, d.id as theme_id, a.soumission '
                                               'FROM frontoffice_operation a, frontoffice_lignebudget b, '
                                               'frontoffice_activiteb c, frontoffice_themes d '
                                               'WHERE a.ligne_budget_id=b.id and b.activite_id=c.id and c.theme_id=d.id')
        except ObjectDoesNotExist:
            pass
        return operations

    def pourcentage_global(self):
        pcentage = 0.0
        try:
            cursor = connection.cursor()
            cursor.execute("SELECT (sum(somme_operation)*100) / (select montantAttribue FROM frontoffice_budgetprojet) "
                           "FROM frontoffice_operation where year(date_operation)=year(now())")
            pcentage = round(cursor.fetchone()[0], 3)
        except Exception:
            pass
        return pcentage

    def pourcentage_mois(self):
        pcentage = 0.0
        try:
            cursor = connection.cursor()
            cursor.execute("SELECT ((sum(a.somme_operation)*100)/sum(b.montant))  "
                           "FROM frontoffice_operation a, frontoffice_lignebudget c, frontoffice_elementmensuel b  "
                           "WHERE month(a.date_operation)=month(now()) AND a.ligne_budget_id=c.id "
                           "AND c.elementPlanMensuel_id=b.id")
            pcentage = round(cursor.fetchone()[0], 3)
        except Exception:
            pass
        return pcentage

    def pourcentage_semestre(self):
        pcentage = 0.0
        try:
            cursor = connection.cursor()
            cursor.execute("SELECT ((sum(a.somme_operation)*100)/(SELECT sum(b.montant)  "
                           "FROM   frontoffice_elementmensuel b))  "
                           "FROM frontoffice_operation a, frontoffice_lignebudget c, frontoffice_elementmensuel b  "
                           "WHERE quarter(a.date_operation)>=quarter(now()) AND a.ligne_budget_id=c.id "
                           "AND c.elementPlanMensuel_id=b.id")
            pcentage = round(cursor.fetchone()[0], 3)
        except Exception:
            pass
        return pcentage


class Operation(models.Model):
    libelle_operation = models.CharField(max_length=100, verbose_name=_('Opération'))
    date_operation = models.DateField(verbose_name=_("Date opération"))
    somme_operation = models.FloatField(verbose_name=_('Montant opération'), default=0)
    ligne_budget = models.ForeignKey(LigneBudget)
    memo = models.TextField(verbose_name=_("Note"))
    projet = models.ForeignKey(Projet)
    etat_soumission = (
        (1, _('Validée')),
        (2, _('Soumise')),
        (3, _('Rejettée')),
        (4, _('Brouillon'))
    )
    soumission = models.PositiveSmallIntegerField(verbose_name=_("Etat soumission"), choices=etat_soumission, default=4)
    reference_paiement = models.CharField(max_length=50, verbose_name=_('Reférence paiement'), blank=True)
    objects = models.Manager()
    my_objects = OperationManager()

    def __unicode__(self):
        return "%s" % self.libelle_operation


class OperationBancaire(Operation):
    operation = models.OneToOneField(Operation)
    opp = (
        (0, _('Virement')),
        (1, _('Cheque'))
    )
    type_operation_bancaire = models.PositiveSmallIntegerField(choices=opp, verbose_name=_("Type d'opération bancaire"))
    reference_operation = models.CharField(max_length=50, verbose_name=_("Référence de l'opération"), blank=True)

    def __unicode__(self):
        return "%s" % self.operation


class OperationCaisse(Operation):
    operation = models.OneToOneField(Operation)
    numRecu = models.IntegerField(verbose_name=_("Numéro reçu"))

    def __unicode__(self):
        return "%s" % self.numRecu