---
title: blog
permalink: /blog/
layout: page
---

# Blog

<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">[{{post.date | date: "%F"}}] {{ post.title }} ({% for tag in post.tags %}#{{tag}}{% unless forloop.last %}, {% endunless %}{% endfor %})</a>
    </li>
  {% endfor %}
</ul>
