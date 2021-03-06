//
//  LXLaunchMovieVC.m
//  TodayNews
//
//  Created by linxiang on 2018/2/28.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXLaunchMovieVC.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

//进入主页面
#import "MainTabBarController.h"

#define LXScreenW   [UIScreen mainScreen].bounds.size.width
#define LXScreenH   [UIScreen mainScreen].bounds.size.height

@interface LXLaunchMovieVC ()

@property (nonatomic, strong) AVPlayerViewController *avPlayerViewController;

@end

@implementation LXLaunchMovieVC


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化AVPlayer
    [self setMoviePlayer];
}

-(void)setMoviePlayer {
    //初始化AVPlayer
    self.avPlayerViewController = [[AVPlayerViewController alloc]init];
    //多分屏功能取消
    if (@available(iOS 9.0, *)) {
        self.avPlayerViewController.allowsPictureInPicturePlayback = NO;
    } else {
        // Fallback on earlier versions
    }
    
    //设置是否显示媒体播放组件
    self.avPlayerViewController.showsPlaybackControls = false;
    
    // 获取媒体资源地址
    NSString *path =  [[NSBundle mainBundle] pathForResource:@"GuidePageHUD_Movie01.mov" ofType:nil];
    
    //初始化一个播放单位。给AVplayer 使用
    AVPlayerItem *item = [[AVPlayerItem alloc]initWithURL:[NSURL fileURLWithPath:path]];
    
    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
    
    //layer
    AVPlayerLayer *layer = [AVPlayerLayer playerLayerWithPlayer:player];
    [layer setFrame:[UIScreen mainScreen].bounds];
    /*  设置填充模式
     可以设置的值及意义如下：
     AVLayerVideoGravityResizeAspect   不进行比例缩放 以宽高中长的一边充满为基准
     AVLayerVideoGravityResizeAspectFill 不进行比例缩放 以宽高中短的一边充满为基准
     AVLayerVideoGravityResize     进行缩放充满屏幕
     */
    layer.videoGravity = AVLayerVideoGravityResize;
    
    
    //设置AVPlayerViewController内部的AVPlayer为刚创建的AVPlayer
    self.avPlayerViewController.player = player;
    //添加到self.view上面去
    [self.view.layer addSublayer:layer];
    //开始播放
    [self.avPlayerViewController.player play];
    
    
    //这里设置的是重复播放。
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(playDidEnd:)
                                                 name:AVPlayerItemDidPlayToEndTimeNotification
                                               object:item];
    
    
    //定时器。延迟3秒再出现进入应用按钮
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(setupLoginView) userInfo:nil repeats:YES];
}

//播放完成的代理
- (void)playDidEnd:(NSNotification *)Notification{
    //播放完成后。设置播放进度为0 。 重新播放
    [self.avPlayerViewController.player seekToTime:CMTimeMake(0, 1)];
    //开始播放
    [self.avPlayerViewController.player play];
}

- (void)setupLoginView
{
    //进入按钮
    UIButton *enterMainButton = [[UIButton alloc] init];
    enterMainButton.frame = CGRectMake(30, LXScreenH - 48 - 50 - BOTTOM_HEIGHT, LXScreenW - 60, 48);
    enterMainButton.layer.borderWidth = 1;
    enterMainButton.layer.cornerRadius = 24;
    //    enterMainButton.alpha = 0;
    enterMainButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [enterMainButton setTitle:@"进入应用" forState:UIControlStateNormal];
    [self.view addSubview:enterMainButton];
    [enterMainButton addTarget:self action:@selector(enterMainAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //    [UIView animateWithDuration:0.5 animations:^{
    //        enterMainButton.alpha = 1;
    //    }];
}

- (void)enterMainAction:(UIButton *)btn {
    MainTabBarController * mainTabarVC = [MainTabBarController new];
    self.view.window.rootViewController = mainTabarVC;
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
