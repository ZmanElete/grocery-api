# Generated by Django 4.0.4 on 2023-01-03 03:06

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0011_item_checked'),
    ]

    operations = [
        migrations.AddField(
            model_name='recipe',
            name='list',
            field=models.ForeignKey(default=0, on_delete=django.db.models.deletion.CASCADE, to='api.list'),
            preserve_default=False,
        ),
    ]