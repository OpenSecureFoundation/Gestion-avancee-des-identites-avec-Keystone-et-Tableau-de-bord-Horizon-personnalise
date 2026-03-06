from django.urls import path
from openstack_dashboard.dashboards.identity.abac_audit import views

urlpatterns = [
    path('', views.IndexView.as_view(), name='index'),
]