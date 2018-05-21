//
//  Study_SandboxShowVC.m
//  TodayNews
//
//  Created by linxiang on 2018/5/21.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Study_SandboxShowVC.h"

#import "GCDWebUploader.h"

#import <WebKit/WebKit.h>

@interface Study_SandboxShowVC ()<WKUIDelegate,WKNavigationDelegate>

@property (nonatomic, strong) WKWebView * wkWebView;

@end

@implementation Study_SandboxShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"真机查看沙盒文件";
    self.view.backgroundColor = LXRandomColor;
    
    
    
    _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREENH_HEIGHT - 20)];//self.view.bounds
    
    //新特性，解决偏移的问题
    if (@available(iOS 11.0, *)) {
        _wkWebView.scrollView.contentInsetAdjustmentBehavior =UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    [_wkWebView setUIDelegate:self];
    _wkWebView.navigationDelegate = self;
    
    //关闭 滚动弹簧功能
    _wkWebView.scrollView.bounces = NO;
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[self startGCDWebUploader]];
    [self.view addSubview: _wkWebView];
    
    
    [_wkWebView loadRequest:request];
}



/**
 使用GCDWebUploader开启APP为服务器
 */
-(NSURL *)startGCDWebUploader{
    NSString *homeDir = NSHomeDirectory();
    GCDWebUploader * _webUploader = [[GCDWebUploader alloc] initWithUploadDirectory:homeDir];
    [_webUploader start];
//    LXLog(@"Visit %@ in your web browser", _webUploader.serverURL);
    
    return _webUploader.serverURL;
}

-(void)webview {
    
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
