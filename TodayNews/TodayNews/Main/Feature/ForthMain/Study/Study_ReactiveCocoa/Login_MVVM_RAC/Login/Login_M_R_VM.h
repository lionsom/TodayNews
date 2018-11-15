//
//  Login_M_R_VM.h
//  TodayNews
//
//  Created by linxiang on 2018/11/12.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Login_M_R_BaseVM.h"

#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface Login_M_R_VM : Login_M_R_BaseVM

/// 手机号
@property (nonatomic, readwrite, copy) NSString *mobilePhone;

/// 验证码
@property (nonatomic, readwrite, copy) NSString *verifyCode;

/// 用户头像
@property (nonatomic, readonly, copy) NSString *avatarUrlString;

/// 按钮能否点击
@property (nonatomic, readonly, strong) RACSignal *validLoginSignal;

/// 登录按钮点击执行的命令
@property (nonatomic, readonly, strong) RACCommand *loginCommand;

@end

NS_ASSUME_NONNULL_END
