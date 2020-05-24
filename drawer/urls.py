"""drawer URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from app01 import views
from app01 import usermsg
urlpatterns = [
    path('admin/', admin.site.urls),
    path('useremail/', usermsg.useremail),
    path('register/', usermsg.register),
    path('checkCode/', usermsg.checkCode),
    path('login/', usermsg.login),
    path('logout/', usermsg.logout),
    path('index/', views.index),
    path('zan/', views.zan),
    path('management/', views.management),
    path('history/', views.history),
    path('usersit/', views.usersit),
    path('district/', views.district),
    path('punster/', views.punster),
    path('picdis/', views.picdis),
    path('otat/', views.otat),
    path('qana/', views.qana),
    path('weather/', views.weather),
    re_path(r'comment-(\d+)/', views.comment),

]
