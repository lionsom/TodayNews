//
//  Study_PropertyVC.m
//  TodayNews
//
//  Created by linxiang on 2018/7/16.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Study_PropertyVC.h"

@interface Study_PropertyVC ()

@end

@implementation Study_PropertyVC

@synthesize myTitle = _newtitle;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = LXRandomColor;
    
    _newtitle = @"AAAA";
    LXLog(@"title = %@",_newtitle);
    
    
    [self setMyTitle:@"BBBB"];
    LXLog(@"title = %@",self.myTitle);
}

// 重写setter getter
- (NSString *)myTitle{
    return _newtitle;
}

- (void)setMyTitle:(NSString *)myTitle{
    _newtitle = myTitle;
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
