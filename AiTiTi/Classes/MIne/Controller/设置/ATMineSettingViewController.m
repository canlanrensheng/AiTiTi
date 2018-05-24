//
//  ATMineSettingViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/11.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineSettingViewController.h"
#import "ATMineSettingCell.h"

@interface ATMineSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * titleArray;
@property(nonatomic,strong)NSArray * detailArray;

@end

@implementation ATMineSettingViewController

-(NSArray *)titleArray{
    if (_titleArray == nil) {
            _titleArray = @[@[@"头像",@"昵称",@"性别",@"生日"],@[@"学校",@"年级"],@[@"推荐人",@"检查更新",@"修改密码"]];
    }
    return _titleArray;
}
-(NSArray *)detailArray{
    if (_detailArray == nil) {
        _detailArray = @[@[@"",@"小霸王",@"女",@"1998-09-09"],@[@"广州XX中学",@"高三"],@[@"17340",@"1.0",@""]];
    }
    return _detailArray;
}

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = ATWhite;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 70, 0)];
    
    UIView * view = [UIView new];
    [self.view addSubview:view];
    
    [view autoSetDimensionsToSize:CGSizeMake(ATScreenWidth, 70)];
    [view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    
    UIButton * button = [UIButton buttonWithTitle:@"退出登录" titleColor:ATWhite font:kFONT15 target:self action:@selector(exitAction)];
    button.backgroundColor = ATBlue;
    button.cornerRadius = 20;
    [view addSubview:button];
    
    [button autoSetDimension:ALDimensionHeight toSize:40];
    [button autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(5, 20, 5, 20) excludingEdge:ALEdgeBottom];
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * arr = self.titleArray[section];
    return arr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row == 0) {
        ATMineSettingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"settingHeader"];
        if (cell == nil) {
            cell = [[ATMineSettingCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"settingHeader"];
        }
        cell.textLabel.text = self.titleArray[indexPath.section][indexPath.row];
        cell.textLabel.font = kFONT14;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"setting"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"setting"];
        }
        cell.textLabel.text = self.titleArray[indexPath.section][indexPath.row];
        cell.detailTextLabel.text = self.detailArray[indexPath.section][indexPath.row];
        cell.textLabel.font = kFONT14;
        cell.detailTextLabel.font = kFONT14;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}
//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    if (section == self.titleArray.count -1) {
        view.backgroundColor = [UIColor clearColor];
    }else{
        view.backgroundColor = RGB(234, 234, 235);
    }
    return view ;
}
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    if (section == self.titleArray.count -1) {
        view.backgroundColor = [UIColor clearColor];
    }else{
        view.backgroundColor = RGB(234, 234, 235);
    }
    return view;
}

#pragma mark - Action
-(void)exitAction{
    //
}

@end
