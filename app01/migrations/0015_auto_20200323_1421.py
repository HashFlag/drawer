# Generated by Django 3.0 on 2020-03-23 06:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app01', '0014_auto_20200323_1420'),
    ]

    operations = [
        migrations.AlterField(
            model_name='comment',
            name='user',
            field=models.CharField(max_length=32, null=True),
        ),
    ]
