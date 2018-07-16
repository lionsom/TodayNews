//
//  Study_PropertyVC.h
//  TodayNews
//
//  Created by linxiang on 2018/7/16.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Study_PropertyVC : UIViewController

@property (copy, nonatomic) NSString *myTitle;

// 重写setter getter
-(NSString *)myTitle;
-(void)setMyTitle:(NSString *)myTitle;

@end
