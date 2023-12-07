---
layout: page
title: "Experiments"
permalink: /experiments/
---

{% for page in site.pages %}
  {% if page.path contains '_experiments' and page.url != '/experiments/' and page.title != null %}
    <h2><a href="{{ page.url }}">{{ page.title }}</a></h2>
    <p>{{ page.content | strip_html | truncatewords:50 }}</p>
  {% endif %}
{% endfor %}