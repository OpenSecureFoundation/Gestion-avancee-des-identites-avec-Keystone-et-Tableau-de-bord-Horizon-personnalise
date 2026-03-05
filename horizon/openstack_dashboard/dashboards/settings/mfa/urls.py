from django.urls import re_path
from openstack_dashboard.dashboards.settings.mfa import views

urlpatterns = [
    re_path(r'^$', views.IndexView.as_view(), name='index'),
    # On ajoute la route pour le bouton
    re_path(r'^activer/$', views.ActiverRegleView.as_view(), name='activer'),
]