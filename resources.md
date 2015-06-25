---
layout: page
title: Resources
permalink: /resources/
menu: true
order: 3
---

Resources are grouped into four categories: corpora, tools, events and other.

Corpora
-------

The most popular annotated and unannotated corpora created by and/or used by
researchers in the field of automatic grammatical error correction.

<ol>
{% for resource in site.data.resources.corpora %}
  <li>
    <span class="resource-entry">
      <a href="{{ resource.url }}">{{ resource.name }}</a> 
      &mdash;
      {{ resource.description }}

      {% if resource.paper %}
        <a class="bibtex-pdf" href="/publications/#{{ resource.paper }}"></a>
      {% endif %}

      <span class="resource-info">Annotated: 
        {% if resource.annotated %} yes.
        {% elsif resource.annotated != null %} no.
        {% else %} no information.
        {% endif %}
      </span>
      {% if resource.size %} 
        <span class="resource-info">Size: {{ resource.size }}.</span>
      {% endif %}
    </span>
  </li>
{% endfor %}
</ol>


Tools
-----

Useful tools that has been used to develop a various grammatical error
correction system, for example NLP tools, machine learning toolkits, evaluation
scripts, etc.

<ol>
{% for resource in site.data.resources.tools %}
  <li>
    <span class="resource-entry">
      <a href="{{ resource.url }}">{{ resource.name }}</a> 
      &mdash;
      {{ resource.description }}

      {% if resource.paper %}
        <a class="bibtex-pdf" href="{{ resource.paper }}"></a>
      {% endif %}
    </span>
  </li>
{% endfor %}
</ol>


