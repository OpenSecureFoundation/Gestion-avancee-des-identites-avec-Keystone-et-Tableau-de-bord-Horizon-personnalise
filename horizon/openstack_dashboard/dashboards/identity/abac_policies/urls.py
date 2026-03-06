from django.urls import path
from openstack_dashboard.dashboards.identity.abac_policies import views

urlpatterns = [
    # La page principale qui liste les règles
    path('', views.IndexView.as_view(), name='index'),
    # La future page avec le formulaire de création (UC3)
    path('create/', views.CreateView.as_view(), name='create'),
    path('create_context/', views.CreateContextView.as_view(), name='create_context'),
]