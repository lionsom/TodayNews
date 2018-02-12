//
//  MainTabbarView.m
//  TodayNews
//
//  Created by linxiang on 2018/2/11.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "MainTabbarView.h"

@implementation MainTabbarView

-(instancetype)init {
    self = [super init];
    if (self) {
        [self CreateView];
    }
    return self;
}


-(void)CreateView {
    [self setBackgroundColor:[[UIColor grayColor]colorWithAlphaComponent:0.5]];
    
    
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
