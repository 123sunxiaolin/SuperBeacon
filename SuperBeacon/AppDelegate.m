//
//  AppDelegate.m
//  SuperBeacon
//
//  Created by kys-2 on 15-3-27.
//  Copyright (c) 2015年 孙晓林. All rights reserved.
//

#import "AppDelegate.h"
#import "SlideMenuViewController.h"
#import "MarketViewController.h"
#import "T4Marco.h"
#import <SMS_SDK/SMS_SDK.h>
#import "UserManager.h"

#define appKey @"727e0bee21bc"
#define appSecret @"c94a2a4f0a03de4912e7001068eff780"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [SMS_SDK registerApp:appKey
              withSecret:appSecret];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    SlideMenuViewController *menu = [[SlideMenuViewController alloc]init];
    MarketViewController *locationViewController = [[MarketViewController alloc]init];
    UINavigationController *frontNav = [[UINavigationController alloc]initWithRootViewController:locationViewController];
    _revealController = [PKRevealController revealControllerWithFrontViewController:frontNav leftViewController:menu];
    self.window.rootViewController = _revealController;
    [self.window makeKeyAndVisible];
    T4_LOG_INFO(@"avaturUrl = %@",[UserManager sharedInstance].avatarUrl);
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
