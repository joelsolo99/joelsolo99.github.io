layout: page
title: "Experiments"
permalink: /experiments/
---

{% for page in site.pages %}
  {% if page.path contains 'experiments' %}
    <h2><a href="{{ page.url }}">{{ page.title }}</a></h2>
    <p>{{ page.excerpt }}</p>
  {% endif %}
{% endfor %}