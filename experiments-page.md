---
layout: page
title: "Experiments"
permalink: /experiments/
---


{% for post in site.experiments %}
  <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
  <p>{{ post.excerpt }}</p>
{% endfor %}
