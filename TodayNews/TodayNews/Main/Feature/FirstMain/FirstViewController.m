//
//  FirstViewController.m
//  TodayNews
//
//  Created by linxiang on 2018/2/8.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view setBackgroundColor:[UIColor orangeColor]];
   
    self.navigationController.navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.hidden = YES;
    
    
    UIButton * A = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [A setBackgroundColor:[UIColor redColor]];
    [A addTarget:self action:@selector(AA) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:A];
    
    UIButton * B = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    [B setBackgroundColor:[UIColor redColor]];
    [B addTarget:self action:@selector(AA) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:B];
    
}


-(void)AA{
//    [self goto_A];
    LXLog(@"CCCCC");
}

-(void)goto_A {
    UIViewController * controller = [Mediator LoginComponent_LoginVC];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
