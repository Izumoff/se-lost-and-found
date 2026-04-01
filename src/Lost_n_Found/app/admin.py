"""
app/admin.py
"""

from django.contrib import admin

from .models import Report


@admin.register(Report)
class ReportAdmin(admin.ModelAdmin):
    list_display = ("id", "title", "report_type", "is_published", "created_at")
    list_filter = ("report_type", "is_published")
    search_fields = ("title", "description", "location_text")

