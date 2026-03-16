from django.urls import path
from . import views

urlpatterns = [
    path('', views.BudgetView.as_view(), name='index'),
]