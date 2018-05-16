//
//  study_threadSecureVC.m
//  TodayNews
//
//  Created by linxiang on 2018/5/16.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "study_threadSecureVC.h"

@interface study_threadSecureVC ()

@end

@implementation study_threadSecureVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = LXRandomColor;
    self.title = @"线程安全";
    
    float W = SCREEN_WIDTH;
    float H = 50;
    [self createBtn:CGRectMake(0, H*1, W, H) :1 :@"synchronized"];
    [self createBtn:CGRectMake(0, H*2, W, H) :2 :@"dispatch_semaphore"];
    [self createBtn:CGRectMake(0, H*3, W, H) :3 :@"NSLock"];
}


-(void)btnCallBack:(id)sender {
    UIButton * btn = (UIButton *)sender;
    
    if (btn.tag == 1) {
        [self synchronized];
    }
    if (btn.tag == 2) {
        [self semaphore];
    }
    if (btn.tag == 3) {
        [self NSLock];
    }
}


-(void)synchronized {
    NSObject *obj = [[NSObject alloc] init];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        @synchronized(obj) {
            NSLog(@"需要线程同步的操作1 开始");
            [NSThread sleepForTimeInterval:3];              // 模拟耗时操作
            NSLog(@"需要线程同步的操作1 结束");
        }
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"我在锁外面");
        @synchronized(obj) {
            NSLog(@"需要线程同步的操作2");
        }
    });
}


-(void)semaphore {
    dispatch_semaphore_t signal = dispatch_semaphore_create(1);
    dispatch_time_t overTime = dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(signal, overTime);
        NSLog(@"需要线程同步的操作1 开始");
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"需要线程同步的操作1 结束");
        dispatch_semaphore_signal(signal);
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_semaphore_wait(signal, overTime);
        NSLog(@"需要线程同步的操作2");
        dispatch_semaphore_signal(signal);
    });
}

-(void)NSLock {
    NSLock *lock = [[NSLock alloc] init];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //[lock lock];
        [lock lockBeforeDate:[NSDate date]];
        NSLog(@"需要线程同步的操作1 开始");
        sleep(2);
        NSLog(@"需要线程同步的操作1 结束");
        [lock unlock];
        
    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        if ([lock tryLock]) {//尝试获取锁，如果获取不到返回NO，不会阻塞该线程
            NSLog(@"锁可用的操作");
            [lock unlock];
        }else{
            NSLog(@"锁不可用的操作");
        }
        
        NSDate *date = [[NSDate alloc] initWithTimeIntervalSinceNow:3];
        if ([lock lockBeforeDate:date]) {//尝试在未来的3s内获取锁，并阻塞该线程，如果3s内获取不到恢复线程, 返回NO,不会阻塞该线程
            NSLog(@"没有超时，获得锁");
            [lock unlock];
        }else{
            NSLog(@"超时，没有获得锁");
        }
        
    });
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
