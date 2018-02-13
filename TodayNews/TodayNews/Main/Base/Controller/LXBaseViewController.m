//
//  LXBaseViewController.m
//  TodayNews
//
//  Created by linxiang on 2018/2/8.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "LXBaseViewController.h"

@interface LXBaseViewController ()

@end

@implementation LXBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置应用的背景色
    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
     默认情况下extendedLayoutIncludesOpaqueBars = false 扩展布局不包含导航栏
     默认情况下automaticallyAdjustsScrollViewInsets = true 自动计算滚动视图的内容边距
        不允许 viewController 自动调整，我们自己布局；如果设置为YES，视图会自动下移 64 像素
     */
    self.extendedLayoutIncludesOpaqueBars = NO;
    if (@available(iOS 11.0, *)) {
        
    } else {
//        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    
    // 没有NavigationBar 设置返回按钮
    UIButton * BackBtn = [[UIButton alloc]initWithFrame:CGRectMake(5, STATUS_HEIGHT, 30, 30)];
    [BackBtn setBackgroundImage:[UIImage imageNamed:@"back_more1"] forState:UIControlStateNormal];
    [BackBtn addTarget:self action:@selector(BackBtnCallBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:BackBtn];

}

#pragma mark - 返回按钮的点击事件
- (void)BackBtnCallBack {
    [self.navigationController popViewControllerAnimated:YES];
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
