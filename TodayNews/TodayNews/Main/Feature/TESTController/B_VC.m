//
//  B_VC.m
//  TodayNews
//
//  Created by linxiang on 2018/2/12.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "B_VC.h"

@interface B_VC ()

@end

@implementation B_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:LXRandomColor];
    
    self.title = @"B_VC";
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
