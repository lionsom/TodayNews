//
//  Study_SandboxFilePathVC.m
//  TodayNews
//
//  Created by 林祥 on 2018/4/16.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Study_SandboxFilePathVC.h"

@interface Study_SandboxFilePathVC ()

@end

@implementation Study_SandboxFilePathVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0];

    LXLog(@"AA = %@",path);
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
