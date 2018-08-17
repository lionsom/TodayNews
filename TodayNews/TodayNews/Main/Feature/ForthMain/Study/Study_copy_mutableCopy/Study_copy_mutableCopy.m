//
//  Study_copy_mutableCopy.m
//  TodayNews
//
//  Created by linxiang on 2018/8/17.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Study_copy_mutableCopy.h"

@interface Study_copy_mutableCopy ()

@end

@implementation Study_copy_mutableCopy

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = LXRandomColor;


    [self stringCopyAndMutableCopy];

    [self mutableStringCopyAndMutableCopy];
 
}


#pragma mark - NSString、NSMutableString、NSArray、NSMutableArray分别进行copy和mutableCopy时的情况

#pragma mark - 1.系统的非容器类对象
// 这里指的是NSString,NSNumber等等一类的对象。

-(void)stringCopyAndMutableCopy {
    NSString * originStr = @"origin";
    NSString * originStrCopy = [originStr copy];
    NSString * originStrMutableCopy = [originStr mutableCopy];
    
    NSLog(@"originStr = %p = %@",originStr,originStr);
    NSLog(@"originStrCopy = %p = %@",originStrCopy,originStrCopy);
    NSLog(@"originStrMutableCopy = %p = %@",originStrMutableCopy,originStrMutableCopy);
}

-(void)mutableStringCopyAndMutableCopy {
    NSMutableString *mutableOriginStr = [NSMutableString stringWithFormat:@"mutableOrigin"];  // @"mutableOrigin";
    NSMutableString *mutableOriginStrCopy = [mutableOriginStr copy];
    NSMutableString *mutableOriginStrMutableCopy = [mutableOriginStr mutableCopy];

    NSLog(@"mutableOriginStr = %p = %@",mutableOriginStr,mutableOriginStr);
    NSLog(@"mutableOriginStrCopy = %p = %@",mutableOriginStrCopy,mutableOriginStrCopy);
    NSLog(@"mutableOriginStrMutableCopy = %p = %@",mutableOriginStrMutableCopy,mutableOriginStrMutableCopy);
}


#pragma mark - 2.系统的容器类对象
// 指NSArray，NSDictionary等。










- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
