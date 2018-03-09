//
//  AppDelegate.m
//  TodayNews
//
//  Created by linxiang on 2018/2/8.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "AppDelegate.h"

#import <AFNetworking/AFNetworking.h>

#import "LXADView.h"

//CoreData相关
#import "AppUseTime_API.h"
#import "AppUseTime+CoreDataClass.h"

// 获取时间扩展
#import "NSString+DisplayTime.h"

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
    
//------ 开启网络监测 ------
    [self startReachability];
    
//------ 设置主页面 ------
    self.window = [[UIWindow alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREENH_HEIGHT)];
    self.window.backgroundColor = [UIColor orangeColor];
    
    // 第一次为NO
    BOOL isfirstUP = [LXUDCache lx_loadCache_Bool:UD_KEY_ISFIRSTUSEAPP];
        
    if (isfirstUP) {
        // 已经启动过了，可以显示广告了
        _mainTabBarController = [MainTabBarController new];
        self.window.rootViewController = _mainTabBarController;
        [self.window makeKeyAndVisible];
    }else{
        // 不是首次启动
        [LXUDCache lx_setCache:[NSNumber numberWithBool:YES] forKey:UD_KEY_ISFIRSTUSEAPP];

        LXLaunchMovieVC * vc = [LXLaunchMovieVC new];
        self.window.rootViewController= vc;
        [self.window makeKeyAndVisible];
    }
    
    NSLog(@"%s",__func__);
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    
    NSLog(@"%s",__func__);
    // 保存到数据库
    
    //记录离开APP时间点
    NSString * endtime = [NSString getCurrentTime];
    NSString * starttime = [LXUDCache lx_loadCache:UD_KEY_APPRESIGNACTIVETIME];
    
    // 计算时间间隔
    NSString * starttimeSP = [NSString timeToTimeStamp:starttime];
    NSString * endtimeSP = [NSString timeToTimeStamp:endtime];
    long long diff = [endtimeSP longLongValue] - [starttimeSP longLongValue];
    
    // 创建对象
    AppUseTime * model = [[AppUseTime alloc]init];
    model.date = @"2018-03-09";
    model.starttime = starttime;
    model.endtime = endtime;
    model.timediff = [NSString stringWithFormat:@"%lld",diff];
    
    AppUseTime_API * A = [AppUseTime_API sharedInstance];
    [A insertModel:model success:^{
        
    } fail:^(NSError *error) {
        
    }];
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSLog(@"%s",__func__);
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    
    // 第一次为NO
    BOOL openlaunchAD = [LXUDCache lx_loadCache_Bool:UD_KEY_ISOPENLAUNCH_AD];

    if (openlaunchAD) {
        // 已经启动过了，可以显示广告了
        LXADView * ADView = [[LXADView alloc]my_init];
        [self.window addSubview:ADView];
    }
    
    NSLog(@"%s",__func__);
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"%s",__func__);
    
    //记录进入APP时间点
    NSString * timeStr = [NSString getCurrentTime];
    [LXUDCache lx_setCache:timeStr forKey:UD_KEY_APPDIDACTIVETIME];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"%s",__func__);
}


/**
 开启网络监测
 */
-(void)startReachability {
    AFNetworkReachabilityManager * manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
//                [SVProgressHUD showWarning:@"未知网络"];
                break;
            case AFNetworkReachabilityStatusNotReachable:
//                [SVProgressHUD showWarning:@"请检测网络状态"];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
//                [SVProgressHUD showWarning:@"3G/4G"];
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
//                [SVProgressHUD showWarning:@"WiFi"];
                break;
            default:
                break;
        }
    }];
    //开启监测
    [manager startMonitoring];
}




@end
