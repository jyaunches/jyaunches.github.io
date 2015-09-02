---
layout: post
title: Running unit tests on actual device
description: "Run your unit tests on an actual iOS device"
modified: 2014-12-10
tags: [iOS, Xcode unit tests]
image:
  feature: 
  credit: 
  creditlink: 
---

When doing iOS app development, most unit test suites are fine to run on the simulator. I found myself in the situation on a current project of mine that the app I'm developing uses libraries where it can't run on a simulator.

The problem was that on app launch, in the app delegate, there are references to these libraries and the app then crashes. No unit tests get run.

I didn't want to start littering if else statements in my AppDelegate.

I found the easiest thing to do was add a whole new AppDelegate. I called mine SpecAppDelegate

{% highlight objective-c %}
#import "SpecsAppDelegate.h"

@implementation SpecsAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application { }
- (void)applicationDidEnterBackground:(UIApplication *)application { }
- (void)applicationWillEnterForeground:(UIApplication *)application { }
- (void)applicationDidBecomeActive:(UIApplication *)application { }
- (void)applicationWillTerminate:(UIApplication *)application { }

@end
{% endhighlight %}

And then use this in your main.m when you're launching the app for unit tests.

{% highlight objective-c %}
int main(int argc, char* argv[]) {
    int returnValue;
    
    @autoreleasepool {
        BOOL inTests = (NSClassFromString(@"SenTestCase") != nil
                        || NSClassFromString(@"XCTest") != nil);
        
        if (inTests) {
            returnValue = UIApplicationMain(argc, argv, nil, @"SpecsAppDelegate");
        }
        else {
            returnValue = UIApplicationMain(argc, argv, nil, @"AppDelegate");
        }
    }
    
    return returnValue;
}
{% endhighlight %}