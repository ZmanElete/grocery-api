# Generated by Django 4.0.4 on 2023-01-20 16:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0015_alter_ingredient_options'),
    ]

    operations = [
        migrations.AddField(
            model_name='list',
            name='tags',
            field=models.ManyToManyField(to='api.tag'),
        ),
        migrations.AddField(
            model_name='recipe',
            name='tags',
            field=models.ManyToManyField(to='api.tag'),
        ),
    ]
