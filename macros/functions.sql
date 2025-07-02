{% macro margin_percent (margin, purchase_cost) %}
round(safe_divide(margin, purchase_cost), 2)
{% endmacro %}