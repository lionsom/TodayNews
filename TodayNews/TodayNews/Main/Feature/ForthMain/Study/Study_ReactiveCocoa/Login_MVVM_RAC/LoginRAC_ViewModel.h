//
//  LoginRAC_ViewModel.h
//  TodayNews
//
//  Created by 林祥 on 2019/3/12.
//  Copyright © 2019 LX. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LoginRAC_ViewModel : NSObject

@property(nonatomic, strong) RACCommand * loginCommond;

@property (nonatomic, copy) NSString * username;
@property (nonatomic, copy) NSString * password;

@end

NS_ASSUME_NONNULL_END
