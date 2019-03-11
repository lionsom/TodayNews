//
//  LoginRAC_View.m
//  TodayNews
//
//  Created by 林祥 on 2019/3/12.
//  Copyright © 2019 LX. All rights reserved.
//

#import "LoginRAC_View.h"

@implementation LoginRAC_View {
    UITextField * usernameTF;
    UITextField * passwordTF;
    UIButton * loginBtn;
}

- (instancetype)init{
    if (self = [super init]){
        [self initView];
    }
    return self;
}

-(void)initView {
    usernameTF = [[UITextField alloc] init];
    usernameTF.placeholder = @"user";
    [self addSubview:usernameTF];
    
    passwordTF = [[UITextField alloc] init];
    passwordTF.placeholder = @"password";
    [self addSubview:passwordTF];
    
    
    
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
