//
//  Login_M_R_BaseVC.h
//  TodayNews
//
//  Created by linxiang on 2018/11/12.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Login_M_R_BaseVM.h"

NS_ASSUME_NONNULL_BEGIN

@interface Login_M_R_BaseVC : UIViewController

/// The `viewModel` parameter in `-initWithViewModel:` method.
@property (nonatomic, strong, readonly, nonnull) Login_M_R_BaseVM *viewModel;



/// Returns a new view.
- (nullable instancetype)initWithViewModel:(Login_M_R_BaseVM *__nonnull)viewModel;

/// Binds the corresponding view model to the view.
- (void)bindViewModel;

@end

NS_ASSUME_NONNULL_END
