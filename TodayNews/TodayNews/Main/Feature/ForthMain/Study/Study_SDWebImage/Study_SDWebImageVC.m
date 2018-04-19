//
//  Study_SDWebImageVC.m
//  TodayNews
//
//  Created by 林祥 on 2018/4/3.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Study_SDWebImageVC.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface Study_SDWebImageVC (){
    UIImageView * imageV;
}

@end

@implementation Study_SDWebImageVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SDWebImage";
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    imageV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 200, 200)];
    [self.view addSubview:imageV];
    
    
    
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [imageV sd_setImageWithURL:[NSURL URLWithString:@"https://ss0.baidu.com/73F1bjeh1BF3odCf/it/u=1331072331,4134051125&fm=85&s=08A2DD172EF73A820C2CE82F0300E060"] placeholderImage:[UIImage imageNamed:@"camera2"] options:SDWebImageRetryFailed];
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
