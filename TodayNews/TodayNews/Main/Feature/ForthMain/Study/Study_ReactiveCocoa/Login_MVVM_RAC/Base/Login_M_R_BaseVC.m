//
//  Login_M_R_BaseVC.m
//  TodayNews
//
//  Created by linxiang on 2018/11/12.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Login_M_R_BaseVC.h"

#import <ReactiveObjC/ReactiveObjC.h>


#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

@interface Login_M_R_BaseVC ()

@property (nonatomic, readwrite, strong) Login_M_R_BaseVM *viewModel;

@end

@implementation Login_M_R_BaseVC

// when `BaseViewController ` created and call `viewDidLoad` method , execute `bindViewModel` method
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    Login_M_R_BaseVC *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
         @strongify(viewController)
         [viewController bindViewModel];
    }];
    return viewController;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


// bind the viewModel
- (void)bindViewModel
{
//    // set navgation title
//    RAC(self , title) = RACObserve(self, viewModel.title);
//    //    @weakify(self);
//    [self.viewModel.errors subscribeNext:^(NSError *error) {
//        //        @strongify(self)
//        NSLog(@"viewModel 的错误信息 -- %@" , error);
//    }];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
