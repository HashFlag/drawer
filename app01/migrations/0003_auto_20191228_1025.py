# Generated by Django 3.0 on 2019-12-28 02:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0002_commont_favor_news_newtype'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='commont',
            new_name='comment',
        ),
        migrations.AddField(
            model_name='news',
            name='commentcount',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='news',
            name='favorcount',
            field=models.IntegerField(default=0),
        ),
    ]
