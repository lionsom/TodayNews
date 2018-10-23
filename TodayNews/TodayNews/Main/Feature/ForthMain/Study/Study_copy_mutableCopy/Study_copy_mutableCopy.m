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

#pragma mark -- NSString
    // 字符串
    [self NSStringCopyAndMutableCopy];
    
}


// #pragma mark - NSString、NSMutableString、NSArray、NSMutableArray分别进行copy和mutableCopy时的情况

#pragma mark - 1.系统的非容器类对象
// 这里指的是NSString,NSNumber等等一类的对象。

-(void)NSStringCopyAndMutableCopy {
    // const是常量字符串,存在常量区
    // constStr指针存在栈区, 指针指向常量区
    NSString * constStr = @"const";
    NSString * constStrCopy = [constStr copy];
    NSMutableString * constStrMutableCopy = [constStr mutableCopy];
    NSLog(@"constStr = %p",constStr);
    NSLog(@"constStrCopy = %p",constStrCopy);
    NSLog(@"constStrMutableCopy = %p",constStrMutableCopy);

    // originStr在栈中,指向堆区的地址
    NSString * originStr = [NSString stringWithFormat:@"origin"];
    NSString * originStrCopy = [originStr copy];
    NSMutableString * originStrMutableCopy = [originStr mutableCopy];
    NSLog(@"originStr = %p",originStr);
    NSLog(@"originStrCopy = %p",originStrCopy);
    NSLog(@"originStrMutableCopy = %p",originStrMutableCopy);
    
    NSMutableString *mutableOriginStr = [NSMutableString stringWithFormat:@"mutableOrigin"];
    NSMutableString *mutableOriginStrCopy = [mutableOriginStr copy];
    NSMutableString *mutableOriginStrMutableCopy = [mutableOriginStr mutableCopy];
    NSLog(@"mutableOriginStr = %p",mutableOriginStr);
    NSLog(@"mutableOriginStrCopy = %p",mutableOriginStrCopy);
    NSLog(@"mutableOriginStrMutableCopy = %p",mutableOriginStrMutableCopy);
    
    
    [constStrMutableCopy appendString:@"const"];
    
    [originStrMutableCopy appendString:@"origin"];

#pragma warnning - ERROR
    [mutableOriginStrCopy appendString:@"mm"];   // ERROR
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
