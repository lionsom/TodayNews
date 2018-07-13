//
//  Study_EncapsulationVC.h
//  TodayNews
//
//  Created by linxiang on 2018/7/13.
//  Copyright © 2018年 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Study_EncapsulationVC : UIViewController {
    
    float _height; // 车高

@public     // 默认修饰符
    float _capcity; // 油量属性
    
@private
    float _lenght; // 车长
    
@protected
    float _width;   // 车宽
    
@package
    float _price;   // 价格
    
}


/**
 OC方法没有修饰符，一般都是公开访问的，即public的。
 问：我们怎么做到让OC中的一个方法不能被外界访问呢？
 答：只需要在.m文件中实现这个方法，不要在头文件中进行定义。
 */
- (void)run:(float)t;

@end
