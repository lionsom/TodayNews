//
//  Login_M_R_VM.m
//  TodayNews
//
//  Created by linxiang on 2018/11/12.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Login_M_R_VM.h"

#import <ReactiveObjC/ReactiveObjC.h>

@interface Login_M_R_VM()

/// 用户头像
@property (nonatomic, readwrite, copy) NSString *avatarUrlString;

/// 按钮能否点击
@property (nonatomic, readwrite, strong) RACSignal *validLoginSignal;

/// 登录按钮点击执行的命令
@property (nonatomic, readwrite, strong) RACCommand *loginCommand;

@end



@implementation Login_M_R_VM


@end
