---
layout: page
title: About
comments: false
modified: 2017-09-22
---

Originally hailing from the midwest of the United States, over the past 12 years, I've lived and worked across 4 continents. I now find myself engineering mobile platforms in Brooklyn, NY.

Initially working in consulting, I primarily build web solutions, working across a wide range of technologies and industries. After 7 years, mobile development and the emerging NYC start-up scene called. I took my web background and entered the iOS development scene, gradually coming to specialize in architecting mobile-first software platforms for connected hardware.

I've grown and led mobile teams, brought apps from their first line of code through user testing and into production. I know what it means to focus on an MVP and iterate based on user feedback.

#### A few other things I do:

{% for project in site.about %}

<div class="project">
    <div class="thumbnail">
        <a href="{{ project.piece_link }}" target="_blank">
        {% if project.image %}
        <img class="thumbnail" src="/images/about/{{ project.image }}"/>           
        <span>
            <h2>{{ project.title }}</h2>
            <p>{{ project.description }}</p>
        </span>
        {% endif %} 
        </a>
    </div>
</div>

{% endfor %}


            