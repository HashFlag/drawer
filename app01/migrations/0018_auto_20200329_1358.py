# Generated by Django 3.0 on 2020-03-29 05:58

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0017_auto_20200329_1357'),
    ]

    operations = [
        migrations.RenameField(
            model_name='news',
            old_name='userInfoSend',
            new_name='userSend',
        ),
    ]
