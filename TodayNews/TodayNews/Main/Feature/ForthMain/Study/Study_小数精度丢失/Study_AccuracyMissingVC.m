//
//  Study_AccuracyMissingVC.m
//  TodayNews
//
//  Created by linxiang on 2018/4/24.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "Study_AccuracyMissingVC.h"

@interface Study_AccuracyMissingVC ()

@end

@implementation Study_AccuracyMissingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = LXRandomColor;
    
    [self test1];
    
    [self test2];

    [self test3];
    
    [self test4];
    
    [self Size];
    
    

}

-(void)Size {
    size_t charSize = sizeof(char);
    NSLog(@"charSize = %zu", charSize);
    
    size_t shortSize = sizeof(short);
    NSLog(@"shortSize = %zu", shortSize);
    
    size_t intSize = sizeof(int);
    NSLog(@"intSize = %zu", intSize);
    
    size_t floatSize = sizeof(float);
    NSLog(@"floatSize = %zu", floatSize);
    
    size_t doubleSize = sizeof(double);
    NSLog(@"doubleSize = %zu", doubleSize);
}

/**
 NSString 转 float
 */
-(void)test1 {
    NSString *test = @"34.0";
    NSString *test1 = @"34.1";
    
    float testFloat = [test floatValue];//testFloat = 34
    float testFloat1 = [test1 floatValue];//testFloat1 = 34.099998
    
    LXLog(@"AA = %f",testFloat);
    LXLog(@"BB = %f",testFloat1);
    LXLog(@"CC = %.12f",testFloat1);
    
/* Log
    AA = 34.000000
    BB = 34.099998
    CC = 34.099998474121
*/
}


/**
 NSNumber 转 NSString
 */
-(void)test2 {
    NSNumber * number = @8.2;
    
    NSString * str = number.stringValue;
    
    LXLog(@"DD = %@",str);
/*
 DD = 8.199999999999999
 */
}

-(void)test3 {
    double firstD = 11111.7;
    double secondD = 22222.6;
    
    NSString * firstDStr = [NSString stringWithFormat:@"%0.2f",firstD];
    NSString * secondDStr = [NSString stringWithFormat:@"%0.2f",secondD];
    
    LXLog(@"EE = %@ == %@",firstDStr,secondDStr);
    
    double f = [firstDStr doubleValue];
    double s = [secondDStr doubleValue];
    
    LXLog(@"FF = %f == %f",f,s);

    LXLog(@"GG = %.12f == %.12f",f,s);
    
/* Log
 EE = 11111.70 == 22222.60
 FF = 11111.700000 == 22222.600000
 GG = 11111.700000000001 == 22222.599999999999
 */
    
}


/**
 一道测试题，补码
 */
-(void)test4 {
    unsigned char ch = -1;
    
    int val = ch;
    
    LXLog(@"%d",val);
    
    
    int AA = 20;
    int BB = -20;  // int 4 byte  1byte = 8bit     4byte = 32bit   32bit/4 = 8个十六进制数
    
    LXLog(@"%x %x",AA,BB);

/* Log
 255
 14 ffffffec
 */
    
    
    char a = 'a';
    NSLog(@"%x",a);
    //char 型变量 c = ‘a’，字符’a’对应的ASCALL编码是97，则它可以用二进制表示为 0110 0001 = OX61
/* Log
 61
 */
    
    char b = 'A';
    NSLog(@"%x",b);
    
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
