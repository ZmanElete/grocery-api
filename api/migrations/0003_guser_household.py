# Generated by Django 3.1.2 on 2020-10-30 22:50

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0002_household_item_list_listsection_measurement_recipe'),
    ]

    operations = [
        migrations.AddField(
            model_name='guser',
            name='household',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='api.household'),
        ),
    ]
