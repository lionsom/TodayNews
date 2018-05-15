//
//  ForthViewController.m
//  TodayNews
//
//  Created by linxiang on 2018/2/11.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "ForthViewController.h"

// Controller
#import "Study_NSDate_VC.h"
#import "Study_CatchCrash_VC.h"
#import "Study_SDWebImageVC.h"
#import "Study_SandboxFilePathVC.h"
#import "Study_AFNetworkingVC.h"
#import "Study_AccuracyMissingVC.h"
#import "Study_RuntimeVC.h"
#import "Study_NSThreadVC.h"
#import "Study_GCDBaseUseVC.h"
#import "Study_GCDUsefulVC.h"
#import "Study_PassValue_A_VC.h"
#import "Study_AdaptVC.h"


@interface ForthViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@end

@implementation ForthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.tableView];
    
    
}

#pragma mark - TableView DataSource
// Section Number
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

// Rows Number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else if (section == 1) {
        return 1;
    }else if (section == 2) {
        return 1;
    }else if (section == 3) {
        return 1;
    }else if (section == 4) {
        return 1;
    }else if (section == 5) {
        return 3;
    }else if (section == 6) {
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    // 根据标识去缓存池找cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 不写这句直接崩掉，找不到循环引用的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //（这种是没有点击后的阴影效果)
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 右侧小图标 - 箭头
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"NSDate";
        cell.detailTextLabel.text = @"进入";
        return cell;
    }else if (indexPath.section == 0 && indexPath.row == 1){
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"SDWebImage";
        cell.detailTextLabel.text = @"进入";
        return cell;
    } else if (indexPath.section == 0 && indexPath.row == 2){
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"适配相关";
        cell.detailTextLabel.text = @"进入";
        return cell;
    } else if (indexPath.section == 1 && indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"寻找沙盒文件路径";
        cell.detailTextLabel.text = @"进入";
        return cell;
    } else if (indexPath.section == 2 && indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"AFNetworking测试";
        cell.detailTextLabel.text = @"进入";
        return cell;
    } else if (indexPath.section == 3 && indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"小数精度丢失";
        cell.detailTextLabel.text = @"进入";
        return cell;
    } else if (indexPath.section == 4 && indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"Runtime关联对象";
        cell.detailTextLabel.text = @"进入";
        return cell;
    } else if (indexPath.section == 5 && indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"NSThread";
        cell.detailTextLabel.text = @"进入";
        return cell;
    } else if (indexPath.section == 5 && indexPath.row == 1){
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"GCD基本使用场景";
        cell.detailTextLabel.text = @"进入";
        return cell;
    } else if (indexPath.section == 5 && indexPath.row == 2){
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"GCD高级的用法";
        cell.detailTextLabel.text = @"进入";
        return cell;
    }else if (indexPath.section == 6 && indexPath.row == 0){
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"页面传值 - Block";
        cell.detailTextLabel.text = @"进入";
        return cell;
    } else {
        cell.textLabel.text = @"123";
        return cell;
    }

    return nil;
}

#pragma mark - TableView Delegate

// cell高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

// Section顶部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

// Section底部高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView * headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    headView.backgroundColor = [UIColor greenColor];
    UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, 30)];
    titleLabel.textAlignment = NSTextAlignmentLeft;
    titleLabel.textColor = [UIColor orangeColor];
    [headView addSubview:titleLabel];
    
    if (section == 0) {
        titleLabel.text = @"  测试";
    }else if (section == 1) {
        titleLabel.text = @"  SandBox相关";
    }else if (section == 2) {
        titleLabel.text = @"  网络";
    }else if (section == 3) {
        titleLabel.text = @"  基本数据类型";
    }else if (section == 4) {
        titleLabel.text = @"  Runtime";
    }else if (section == 5) {
        titleLabel.text = @"  多线程";
    }else if (section == 6) {
        titleLabel.text = @"  页面传值";
    }else {
        titleLabel.text = @"AAA";
    }
    
    return headView;
}

// 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        Study_NSDate_VC * vc = [[Study_NSDate_VC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 1){
        Study_SDWebImageVC * vc = [[Study_SDWebImageVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 0 && indexPath.row == 2){
        Study_AdaptVC * vc = [[Study_AdaptVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 1 && indexPath.row == 0){
        Study_SandboxFilePathVC * vc = [[Study_SandboxFilePathVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 2 && indexPath.row == 0){
        Study_AFNetworkingVC * vc = [[Study_AFNetworkingVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 3 && indexPath.row == 0){
        Study_AccuracyMissingVC * vc = [[Study_AccuracyMissingVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 4 && indexPath.row == 0){
        Study_RuntimeVC * vc = [[Study_RuntimeVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 5 && indexPath.row == 0){
        Study_NSThreadVC * vc = [[Study_NSThreadVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 5 && indexPath.row == 1){
        Study_GCDBaseUseVC * vc = [[Study_GCDBaseUseVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 5 && indexPath.row == 2){
        Study_GCDUsefulVC * vc = [[Study_GCDUsefulVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }else if (indexPath.section == 6 && indexPath.row == 0){
        Study_PassValue_A_VC * vc = [[Study_PassValue_A_VC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }

    
}



#pragma mark - Lazy init
-(UITableView *)tableView {
    
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH,SCREENH_HEIGHT - TABBAR_HEIGHT-STATUS_HEIGHT - 44) style:UITableViewStylePlain];
        
        //设置代理
        _tableView.delegate = self;
        _tableView.dataSource =self;
        //设置不显示分割线
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        // heightForHeader 和 heightForFooter 两个delegate不执行
        _tableView.estimatedRowHeight = 0;
        if (@available(iOS 11.0, *)) {
            //当有heightForHeader delegate时设置
            _tableView.estimatedSectionHeaderHeight = 0;
            //当有heightForFooter delegate时设置
            _tableView.estimatedSectionFooterHeight = 0;
        }
        
        //其实不用判断两层，@available(iOS 11.0)会有一个else的
        if(@available(iOS 11.0, *)){
            if ([_tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
                _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
            }
        }else {
            self.automaticallyAdjustsScrollViewInsets = NO;
        }
        
        // 解决tableview上按钮点击效果的延迟现象
        _tableView.delaysContentTouches = NO;
        
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
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