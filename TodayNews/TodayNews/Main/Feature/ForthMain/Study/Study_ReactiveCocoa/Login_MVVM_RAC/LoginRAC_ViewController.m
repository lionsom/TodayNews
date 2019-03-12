//
//  LoginRAC_ViewController.m
//  TodayNews
//
//  Created by 林祥 on 2019/3/12.
//  Copyright © 2019 LX. All rights reserved.
//

#import "LoginRAC_ViewController.h"

@interface LoginRAC_ViewController ()

@property (nonatomic, strong) UITextField * usernameTF;
@property (nonatomic, strong) UITextField * passwordTF;

@property (nonatomic, strong) UIButton * loginBtn;
@property (nonatomic, strong) UIButton * logoutBtn;

@end

@implementation LoginRAC_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"MVVM+RAC 登录页面";
    
    // add
    [self.view addSubview:self.usernameTF];
    [self.usernameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view).multipliedBy(0.8);
        make.height.equalTo(@50);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(50);
    }];
    
    [self.view addSubview:self.passwordTF];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view).multipliedBy(0.8);
        make.height.equalTo(@50);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.usernameTF.mas_bottom).offset(20);
    }];
    
    [self.view addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view).multipliedBy(0.8);
        make.height.equalTo(@50);
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.passwordTF.mas_bottom).offset(20);
    }];
    
}


#pragma mark - touchesBegan

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
}

#pragma mark - Lazy init

-(UITextField *)usernameTF {
    if (!_usernameTF) {
        _usernameTF = [[UITextField alloc] init];
        _usernameTF.borderStyle = UITextBorderStyleLine;
        _usernameTF.placeholder = @"输入user，有惊喜";
    }
    return _usernameTF;
}

-(UITextField *)passwordTF {
    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc] init];
        _passwordTF.borderStyle = UITextBorderStyleLine;
        _passwordTF.placeholder = @"输入password，有惊喜";
    }
    return _passwordTF;
}

-(UIButton *)loginBtn {
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setTitle:@"sign in" forState:UIControlStateNormal];
        [_loginBtn setBackgroundImage:[self createImageWithColor:[UIColor lightGrayColor]] forState:UIControlStateDisabled];
        [_loginBtn setBackgroundImage:[self createImageWithColor:[UIColor greenColor]] forState:UIControlStateNormal];
    }
    return _loginBtn;
}


#pragma mark - Private Method
// 根据颜色获取图片
- (UIImage *)createImageWithColor:(UIColor *)color
{
    //图片尺寸
    CGRect rect = CGRectMake(0, 0, 10, 10);
    //填充画笔
    UIGraphicsBeginImageContext(rect.size);
    //根据所传颜色绘制
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    //显示区域
    CGContextFillRect(context, rect);
    // 得到图片信息
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //消除画笔
    UIGraphicsEndImageContext();
    return image;
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
