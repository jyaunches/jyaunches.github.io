---
layout: post
title: Creating & Releasing a CocoaPod!
description: "Quick review of basics for making a CocoaPod"
modified: 2015-09-28
tags: [iOS, CocoaPods]
image:
  feature: 
  credit: 
  creditlink: 
---

pod lib lint
vim JiffyLogger.podspec
git add -A && git commit -m "release 1.0.1"
git tag '1.0.1'
git push --tags
git st
git push origin master
pod trunk me
pod trunk register jmyaunch@gmail.com 'Julie Yaunches' --description='mac mini'
pod trunk me
pod trunk push JiffyLogger.podspec