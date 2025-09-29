---
layout: page
title: "Blog"
permalink: /blog/
main_nav: true
---

{% assign qmd_files = site.data.qmd_files %}

{% for category in site.categories %}
  {% capture cat %}{{ category | first }}{% endcapture %}
  <h2 id="{{cat}}">{{ cat | capitalize }}</h2>

  {% for desc in site.descriptions %}
    {% if desc.cat == cat %}
      <p class="desc"><em>{{ desc.desc }}</em></p>
    {% endif %}
  {% endfor %}

  <ul class="posts-list">
    {% for post in site.categories[cat] %}
      {% assign filename = post.path | split: '/' | last %}
      {% assign basename = filename | split: '.' | first %}
      <li>
        <strong>
          {% if qmd_files contains basename %}
            <a href="{{ '/qmd/' | append: basename | append: '.html' | prepend: site.baseurl }}">
              {{ post.title }}
            </a>
          {% else %}
            <a href="{{ post.url | prepend: site.baseurl }}">
              {{ post.title }}
            </a>
          {% endif %}
        </strong>
        <span class="post-date">- {{ post.date | date_to_long_string }}</span>
      </li>
    {% endfor %}
  </ul>

  {% if forloop.last == false %}<hr>{% endif %}
{% endfor %}
<br>