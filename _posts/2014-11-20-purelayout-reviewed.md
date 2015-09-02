---
layout: post
title: Switching to PureLayout
description: "Auto Layout is a pain.. make your life easier"
modified: 2014-11-20
tags: [iOS, PureLayout, Auto Layout]
image:
  feature: 
  credit: 
  creditlink: 
---

Let me lay something out there. (Pun intended) Auto layout sucks like a hangover on release day.

I've always been a proponent of using tools to make my life easier. I recently discovered [PureLayout](https://github.com/PureLayout/PureLayout). Let me say, it's freaking awesome.

It's essentially just a wrapper and a more friendly API around iOS's auto layout API. In the last 12 months as I've been learning and incorporating auto layout into my UI development, I've sort of created my own auto layout wrapper API. But, it was something I just expanded on as needed and never really polished.

In comes PureLayout. I spent some time trying it out and I now think I'll go ahead and scrap my own wrapper API and switch totally to this.

I thought I'd show the progression of the same code as it moved from using explicitly the iOS autolayout API with my wrapper API, then to PureLayout. It's pretty sweet.

*My wrapper API*

{% highlight objective-c %}

- (void)setToolbarToStandardWidth {
    self.viewsDictionary = @{@"toolbar" : self};
    [self addWidthConstraint:self viewName:@"toolbar"];
}

- (void)addWidthConstraint:(UIView *)view viewName:(NSString *)viewName {
    [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:[NSString stringWithFormat:@"H:[%@(%i)]", viewName, [UIScreen mainScreen].bounds.size.width]
                                                                 options:0
                                                                 metrics:nil
                                                                   views:self.viewsDictionary]];
}

{% endhighlight %}

*PureLayout*

{% highlight objective-c %}

[self.pinPlaceholderView autoSetDimension:ALDimensionWidth toSize:[UIScreen mainScreen].bounds.size.width];

{% endhighlight %}

What I love about it is you don't have to keep that dictionary of views or even think about it. You don't have to deal with the visual format syntax. And you just get much more readability. Love.
