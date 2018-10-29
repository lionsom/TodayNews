//
//  Study_Property_copy.m
//  TodayNews
//
//  Created by linxiang on 2018/10/24.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Study_Property_copy.h"

@interface Study_Property_copy ()

// 1、strong
//@property (nonatomic, strong) NSString *str;
// 2、copy
@property (nonatomic, copy) NSString *str;


@end

@implementation Study_Property_copy

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = LXRandomColor;

    
    // 分别对1和2执行下述代码
    NSMutableString *mutableStr = [NSMutableString stringWithFormat:@"123"];
    self.str = mutableStr;
    [mutableStr appendString:@"456"];
    NSLog(@"%@", self.str);
    NSLog(@"%p", self.str);
    NSLog(@"%@", mutableStr);
    NSLog(@"%p", mutableStr);

    
    // 也许你会疑问arc下如何访问retainCount属性，这里提供了两种方式（下面代码中a代表一个任意对象，这个对象最好不要是NSString和NSNumber，因为用它们进行测试会出问题）
    // 桥接字方式
    NSLog(@"Retain count is %ld", CFGetRetainCount((__bridge CFTypeRef)mutableStr));
    // kvc方式
    NSLog(@"Retain count %@", [mutableStr valueForKey:@"retainCount"]);
}

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
