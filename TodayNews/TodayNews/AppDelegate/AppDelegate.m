//
//  AppDelegate.m
//  TodayNews
//
//  Created by linxiang on 2018/2/8.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "AppDelegate.h"

#import "MainTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//------ 设置按钮互斥 ----- 同一时间只能点击一个按钮
    [[UIButton appearance] setExclusiveTouch:YES];
    
//------ 开启LXLog -------
    // 启动调试日志
    [LXLog defaultCTLog];
    
    // 只显示该开发者的调试日志
    [[LXLog defaultCTLog] setLogOwner:Log_LX];
    
    //测试
    LXLog(@"AAA = %d",112);
    AALog(@"BBB = %@",@"asdf");
    BBLog(@"CCC = %d",23333);
    
//------ 设置主页面 ------
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
    self.window.backgroundColor = [UIColor orangeColor];
    _mainTabBarController = [MainTabBarController new];
    self.window.rootViewController=  _mainTabBarController;
    [self.window makeKeyAndVisible];
    

    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
