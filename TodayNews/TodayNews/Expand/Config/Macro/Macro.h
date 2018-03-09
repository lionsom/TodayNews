//
//  Macro.h
//  TodayNews
//
//  Created by linxiang on 2018/2/8.
//  Copyright © 2018年 LX. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

// W H
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_SIZE [UIScreen mainScreen].bounds.size

#define TABBAR_HEIGHT    ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49) // 适配iPhone x 底栏高度
#define STATUS_HEIGHT    ([[UIApplication sharedApplication] statusBarFrame].size.height>20?44:20) // 适配iPhone x 状态栏
#define BOTTOM_HEIGHT    ([[UIApplication sharedApplication] statusBarFrame].size.height>20?39:0)  // 适配iphone X 底部多出来的高度

//---------------Colour-------------------
//设置随机颜色
#define LXRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//设置RGB颜色/设置RGBA颜色
#define LXRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LXRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

#define COLOR_WITH_HEX(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]


//--------------生成随机数---------------
#define LXRandNum(i) arc4random()%i   // [0,i) 范围内随机数
#define LXRandNum_FromTo(i,j) (from + (arc4random() % (to – from +1)))



//--------------沙盒目录文件---------------
// 获取沙盒主目录路径
#define LXSBPath_Home = NSHomeDirectory();
//获取沙盒 Document
#define LXSBPath_Document [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Library
#define LXSBPath_Library [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) lastObject];
//获取沙盒 Cache
#define LXSBPath_Cache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]
//获取temp
#define LXSBPath_Temp NSTemporaryDirectory()



#endif /* Macro_h */
