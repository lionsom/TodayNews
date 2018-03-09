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
    return 3;
}

// Rows Number
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else if (section == 1) {
        return 3;
    }else if (section == 2) {
        return 10;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        static NSString *ID = @"cell";
        // 根据标识去缓存池找cell
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        // 不写这句直接崩掉，找不到循环引用的cell
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        
        cell.imageView.image = [UIImage imageNamed:@"home_list2"];
        cell.textLabel.text = @"NSDate";
        cell.detailTextLabel.text = @"进入";
        
        //（这种是没有点击后的阴影效果)
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        // 右侧小图标 - 箭头
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

        return cell;
    }else {
        static NSString *ID = @"cell";
        // 根据标识去缓存池找cell
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
        // 不写这句直接崩掉，找不到循环引用的cell
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }
        cell.textLabel.text = @"123";
        
        //（这种是没有点击后的阴影效果)
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
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
        titleLabel.text = @"测试";
    }else {
        titleLabel.text = @"AAA";
    }
    
    return headView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        Study_NSDate_VC * vc = [[Study_NSDate_VC alloc]init];
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
