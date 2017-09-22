---
layout: page
title: About
image:
  feature: burning-man-abstract.png
  credit: 
  creditlink: 
comments: false
modified: 2015-07-12
---

Originally hailing from the midwest of the United States, over the past 12 years, I've lived and worked across 4 continents. I now find myself back in the US, working on mobile application platforms for start-ups in NYC. A few other things I do:

### Lead Organizer - Brooklyn Swift Meetup


{% for project in site.about %}

<div class="project">
    <div class="thumbnail">
        <a href="{{ project.piece_link }}" target="_blank">
        {% if project.image %}
        <img class="thumbnail" src="/images/about/{{ project.image }}"/>
        {% else %}
        <div class="thumbnail blankbox"></div>
        {% endif %}    
        <span>
            <h1>{{ project.title }}</h1>
            <br/>
            <p>{{ project.description }}</p>
        </span>
        </a>
    </div>
</div>

{% endfor %}


            