---
layout: post
title: Getting Started with Jekyll
description: "Up and running with Jekyll in 1 hour"
modified: 2015-09-10
tags: [Jekyll]
image:
  feature: jekyll-logo-light-solid.png
  credit: 
  creditlink: https://jekyll.github.io
---

Get your Github pages/Jekyll website setup in 1 hour.

I recently migrated my personal blog to Github pages and Jekyll and it was so freaking easy it was really quite shocking. The only real difficulty was was that I had to go around to different sources to find all the information I needed to really make it happen.

I decided to coalate it in one place! This is the that information as of Sept 2015.

This post will cover how to:
- setup your development environment
- setup github and your website's repository there
- select an existing jekyll theme
- overview the jekyll directory struction so that you can make updates to suit your needs
- review basic jekyll markdown
- overview publishing your website
- instructions for linking your domain

##1 - Your development environment.

You need the following: RVM, Ruby 2.2.3, RubyGems 

Once you have these you'll need to install the gems: jekyll and bundler

##2 - Setup your website's repository in github

Github do do a good job of telling you [how to do this](https://pages.github.com/).

Clone this repository to your local machine.

##3 - Select an jekyll theme as your baseline.

If you want to get off the ground quickly and not roll your own jekyll website from scratch, [this is the place](http://jekyllthemes.org/) to start.

Pick one that works for you. The have themes for personal websites, product websites, service websites.... there are a lot!

Most of them ask you to fork their github repository.. which is fair because that increases their fork count and makes them look good. So, go ahead and fork the one you like. (You could just download or clone it as well.)

Copy the contents of this into the website's repository you created in step two.

Now you'll want to run it!

In your terminal, from the directory for this new website, run the following:

> bundle install
> jekyll serve

If you then go to http://127.0.0.1:4000/ from your browser, you should see the website running on your local machine!

Do a commit here:

> git commit -am"baseline jekyll template for my new website"

##4 - Overview of Jekyll directory structure

Ok, so Jekyll do a good job of [giving detail](http://jekyllrb.com/docs/structure/) for this. 

At a minimum.. you're going to need to:

1. customize the contents of _config.yml
2. customize the contents of index.html and potentially, header.html and footer.html. (If you want to change things there.)

New Posts/Pages

Pages or page elements are represented with either .html or .md files. Jekyll uses it's own markdown (which we'll get to later). The .md files are ones that contain Jekyll markdown But it will just render .html files as well.

All the templates from you download may organize things differently. So you'll just have to poke around a little to see where they put what. 

Many of the templates will give instructions for getting up and running with that specific template. Use those instructions.

##5 Review of Jekyll Markdown

Jekyll do have a [good source](http://jekyllrb.com/docs/posts/) for this one. Your life will be easier if you use their markdown.

More to fill out here.

##6 Publishing your website.

The way github pages works is the will host basically whatever you've pushed on the master branch of you [github-username].github.io repository. So, once you're happy with it locally, you can commit and push your changes on master. Following this, the website should be viewable at [github-username].github.io.

Whoa! Easy. :-)

As a note, if you're not ready to push any changes out for the world to see, you can commit them on a branch and push that branch to github and the changes will remain there until you merge them onto master.

## Instructions for linking to a domain name.

Once you're really ready for the world to see your new awesome website, you may want to setup a custom domain name. This is super easy, you just need to add a CNAME file to root of your github repository. Github provide instruction [here](https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages/).
