//
//  Study_Ivar_MidStudent.m
//  TodayNews
//
//  Created by linxiang on 2018/7/16.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Study_Ivar_MidStudent.h"

@implementation Study_Ivar_MidStudent

-(instancetype)init {
    
    self = [super init];
    
    if (self) {
        // 访问成员变量，可以通过self->变量名字
        LXLog(@"A = %@",self->_A);
        LXLog(@"B = %@",self->_B);
//        LXLog(@"C = %@",self->_C);
        LXLog(@"D = %@",self->_D);
        LXLog(@"E = %@",self->_E);
    }
    
    return self;
}

@end
