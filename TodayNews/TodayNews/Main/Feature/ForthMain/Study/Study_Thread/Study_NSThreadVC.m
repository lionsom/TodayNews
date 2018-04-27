//
//  Study_NSThreadVC.m
//  TodayNews
//
//  Created by linxiang on 2018/4/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Study_NSThreadVC.h"

@interface Study_NSThreadVC ()

@end

@implementation Study_NSThreadVC



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = LXRandomColor;
    self.title = @"NSThread";

    float W = SCREEN_WIDTH/2;
    float H = 50;
    [self createBtn:CGRectMake(0, H, W, H) :1 :@"NSThread创建方式1"];
    
    [self createBtn:CGRectMake(W, H, W, H) :2 :@"NSThread创建方式2"];
    
    [self createBtn:CGRectMake(0, H*2, W, H) :3 :@"NSThread创建方式3"];
    
    [self createBtn:CGRectMake(W, H*2, W, H) :4 :@"NSThread创建方式"];
}


-(void)btnCallBack:(id)sender {
    UIButton * btn = (UIButton *)sender;
    
    if (btn.tag == 1) {
        LXLog(@"AAA");
        [self creatNSThread1];
    }
    if (btn.tag == 2) {
        LXLog(@"BBB");
        [self craeteNSThread2];
    }
    if (btn.tag == 3) {
        LXLog(@"CCC");
        [self createNSThread3];
    }
    if (btn.tag == 4) {
        LXLog(@"DDD");
    }
    
}

#pragma mark -- NSThrad Create

/**
 创建方法一：
 */
-(void)creatNSThread1{
    //创建NSThrad线程来处理卡顿
    NSThread * thread = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"thread1"];
    //线程命名
    thread.name = @"新线程";
    //启动
    [thread start];
}

/**
 创建方法二：
 */
-(void)craeteNSThread2{
    //从主线程中分离出的子线程，这种子线程不需要手动开启
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"thread2"];
}

/**
 创建方法三：
 */
- (void)createNSThread3 {
    //开一个后台线程 （也属于子线程）
    [self performSelectorInBackground:@selector(run:) withObject:@"thread3"];
    
    [self performSelectorOnMainThread:@selector(mainCallBack:) withObject:@"main" waitUntilDone:YES];
    
    [self performSelectorInBackground:@selector(run:) withObject:@"thread4"];
}

-(void)run:(id)obj {
    
    for (int i = 0; i < 1000; i++) {
        NSLog(@"aa = %d",i);
    }
    
    NSLog(@"--%@ -- %@ --",[NSThread currentThread],obj);
    
    [self performSelector:@selector(delayCallBack) withObject:@"延迟执行" afterDelay:1.0f];
}

-(void)delayCallBack {
    NSLog(@"delayCallBack");
}

-(void)mainCallBack:(id)obj {
    
    NSLog(@"--mainCallBack-- %@ -- %@ --",[NSThread currentThread],obj);
    
    UIAlertView * view = [[UIAlertView alloc]initWithTitle:@"aaa" message:@"BBB" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
    [view show];
}

#pragma mark -- CraeteView
-(void)createBtn:(CGRect)frame :(NSInteger)tag :(NSString *)title {
    UIButton * btn = [[UIButton alloc]initWithFrame:frame];
    btn.backgroundColor = LXRandomColor;
    btn.tag = tag;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnCallBack:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
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
