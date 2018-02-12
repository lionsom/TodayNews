//
//  GlobalConst.h
//  TodayNews
//
//  Created by linxiang on 2018/2/8.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GlobalConst : NSObject

//*****************NetWork TimeOut***********************
//网络请求超时时间
UIKIT_EXTERN double const NetWorkTimeOut_Time;

//************** Just Message *****************
// 用户信息异常，请重新登录
UIKIT_EXTERN NSString * const MESSAGE_ACCOUNT_UNUSUALLY;

// 网络请求
UIKIT_EXTERN NSString * const MESSAGE_HTTPREQUEST_WAITING;   // 等待
UIKIT_EXTERN NSString * const MESSAGE_HTTPREQUEST_SUCCESS;   // 成功
UIKIT_EXTERN NSString * const MESSAGE_HTTPREQUEST_SERVERERROR; //服务器异常
UIKIT_EXTERN NSString * const MESSAGE_HTTPREQUEST_FAILURE;   // 失败

@end
