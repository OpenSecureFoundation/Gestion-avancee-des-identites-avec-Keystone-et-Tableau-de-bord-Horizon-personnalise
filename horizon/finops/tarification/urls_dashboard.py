from django.urls import path
from . import views

urlpatterns = [
    path('', views.DashboardFinopsView.as_view(), name='index'),
]