//
//  Study_RAC_VC.m
//  TodayNews
//
//  Created by linxiang on 2018/11/8.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Study_RAC_VC.h"

#import <ReactiveObjC/ReactiveObjC.h>

@interface Study_RAC_VC ()

@end

@implementation Study_RAC_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = LXRandomColor;

    self.title = @"RAC";
    
// =======================
    //创建segmentControl 分段控件
    UISegmentedControl *segC = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0,50,SCREEN_WIDTH,50)];
    //添加小按钮
    [segC insertSegmentWithTitle:@"demo 1" atIndex:0 animated:YES];
    [segC insertSegmentWithTitle:@"demo 2" atIndex:1 animated:YES];
    //设置样式
    [segC setTintColor:[UIColor grayColor]];
    //设置字体样式
    [segC setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10],NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateNormal];
    //添加事件
    [segC addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segC];
}




//点击按钮事件
-(void)segmentValueChanged:(UISegmentedControl *)seg{
    NSUInteger segIndex = [seg selectedSegmentIndex];
    //将当旧VC的view移除，然后在添加新VC的view
    if (segIndex == 0) {
        [self demo1];
    }else if (segIndex == 1){
        
    }else{
    }
}



-(void)demo1 {

    // 1.创建信号（冷信号）
    RACSignal * signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        // 3.发送信号 （subscriber发送）
        [subscriber sendNext:@"发送消息"];
        
        return nil;
    }];
    
    // 2.订阅信号 （热信号）
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
   
                          
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
