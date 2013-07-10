from django.conf.urls import patterns, url, include
from django.contrib import admin
from django.utils.translation import gettext_lazy as _

admin.autodiscover()
urlpatterns = patterns('',
                       url(r"^$", 'frontoffice.views.login'),
                       url(r"^homepage/$", 'frontoffice.views.homepage'),
                       url(r"^homepage/gestion_operation$", 'frontoffice.views.gestion_op'),
                       url(r"^homepage/gestion_operation/ajouter_operation_caisse$", 'frontoffice.views.add_caisse_op'),
                       url(r"^homepage/gestion_operation/ajouter_operation_banque$", 'frontoffice.views.add_bank_op'),
                       url(r"^homepage/gestion_operation/get_activites/$",
                           'frontoffice.views.get_activites'),
                       url(r"^homepage/gestion_operation/get_lignes/$",
                           'frontoffice.views.get_lignes'),
                       url(r"^homepage/statistique$", 'frontoffice.views.statistique'),
                       url(r"^homepage/suivi_budget$", 'frontoffice.views.suivi_budget'),
                       url(r"^logout/$", 'frontoffice.views.deconnexion'),
                       url(r'^auth/$', 'frontoffice.views.auth_view'),
                       url(r'^resetpassword/$', 'django.contrib.auth.views.password_reset'),
                       url(r'^resetpassword/passwordsent/$', 'django.contrib.auth.views.password_reset_done'),
                       url(r'^reset/(?P<uidb36>[0-9A-Za-z]+)-(?P<token>.+)/$',
                           'django.contrib.auth.views.password_reset_confirm'),
                       url(r'^reset/done/$', 'django.contrib.auth.views.password_reset_complete'),
                       (r'^i18n/', include('django.conf.urls.i18n')),
                       #url(r"^signup/$", SignupView.as_view(), name="profile_signup"),
                       #url(r"^login/$", LoginView.as_view(), name="profile_login"),
                       #url(r"^logout/$", LogoutView.as_view(), name="profile_logout"),

                       # Examples:
                       # url(r'^$', 'new_projo.views.home', name='home'),
                       # url(r'^new_projo/', include('new_projo.foo.urls')),

                       # Uncomment the admin/doc line below to enable admin documentation:
                       url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

                       # Uncomment the next line to enable the admin:
                       url(r'^admin/', include(admin.site.urls)),
)


