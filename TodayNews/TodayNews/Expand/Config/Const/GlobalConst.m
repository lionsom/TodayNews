//
//  GlobalConst.m
//  TodayNews
//
//  Created by linxiang on 2018/2/8.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "GlobalConst.h"

@implementation GlobalConst

//*****************NetWork TimeOut***********************
double const NetWorkTimeOut_Time = 8.0f;


//************** Just Message *****************
// 用户信息异常，请重新登录
NSString * const MESSAGE_ACCOUNT_UNUSUALLY = @"用户信息出错，请重新登录";

// 网络请求
NSString * const MESSAGE_HTTPREQUEST_WAITING = @"请稍等...";            // 等待
NSString * const MESSAGE_HTTPREQUEST_SUCCESS = @"请求成功";             // 成功
NSString * const MESSAGE_HTTPREQUEST_SERVERERROR = @"服务器异常";        //服务器异常
NSString * const MESSAGE_HTTPREQUEST_FAILURE = @"请求失败，请检测网络！";  // 失败




@end
