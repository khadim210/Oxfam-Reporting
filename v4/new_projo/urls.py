from django.conf.urls import patterns, url, include
from django.contrib import admin

admin.autodiscover()
urlpatterns = patterns('',
                       url(r"^$", 'frontoffice.views.login'),
                       url(r"^register$", 'frontoffice.views.addProfile'),
                       url(r"^homepage/$", 'frontoffice.views.homepage'),
                       url(r"^gestion_operation$", 'frontoffice.views.gestion_op'),
                       url(r"^gestion_operation/ajouter_operation_caisse$", 'frontoffice.views.add_caisse_op'),
                       url(r"^gestion_operation/ajouter_operation_banque$", 'frontoffice.views.add_bank_op'),
                       url(r"^gestion_operation/get_activites/$", 'frontoffice.views.get_activites'),
                       url(r"^gestion_operation/detail_operation/(\d+)$", 'frontoffice.views.detail_operation'),
                       url(r"^gestion_operation/get_lignes/$", 'frontoffice.views.get_lignes'),
                       url(r"^gestion_operation/delete_operation/$", 'frontoffice.views.delete_operation'),
                       url(r"^courbe_evolution/$", 'frontoffice.views.depense_par_mois'),
                       url(r"^statistique$", 'frontoffice.views.statistique'),
                       url(r"^soumettre_donnees$", 'frontoffice.views.soumettre'),
                       url(r"^suivi_budget$", 'frontoffice.views.suivi_budget'),
                       url(r"^logout/$", 'frontoffice.views.deconnexion'),
                       url(r'^auth/$', 'frontoffice.views.auth_view'),
                       url(r'^resetpassword/$', 'django.contrib.auth.views.password_reset'),
                       url(r'^resetpassword/passwordsent/$', 'django.contrib.auth.views.password_reset_done'),
                       url(r'^reset/(?P<uidb36>[0-9A-Za-z]+)-(?P<token>.+)/$',
                           'django.contrib.auth.views.password_reset_confirm'),
                       url(r'^reset/done/$', 'django.contrib.auth.views.password_reset_complete'),
                       (r'^i18n/', include('django.conf.urls.i18n')),
                       # Examples:
                       # url(r'^$', 'new_projo.views.home', name='home'),
                       # url(r'^new_projo/', include('new_projo.foo.urls')),

                       # Uncomment the admin/doc line below to enable admin documentation:
                       url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

                       # Uncomment the next line to enable the admin:
                       url(r'^admin/', include(admin.site.urls)),
)


