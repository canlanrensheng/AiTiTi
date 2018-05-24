//
//  ATMineViewController.m
//  AiTiTi
//
//  Created by 童城 on 2018/4/23.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineViewController.h"
#import "ATMineHeaderCell.h"
#import "ATMineCourceViewController.h"
#import "ATMineMoneyViewController.h"
#import "ATMineSettingViewController.h"
#import "ATMineHelpViewController.h"
#import "ATVIPViewController.h"
#import "ATLoginViewController.h"
#import "ATMineCommentViewController.h"
#import "ATMineAchieveViewController.h"
#import "ATMinCouponViewController.h"
#import "ATMineStudyViewController.h"
#import "ATMineDownloadViewController.h"
#import "ATMineCENViewController.h"

#import "ATFriendPayViewController.h"

@interface ATMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSArray * dataArray;
@property(nonatomic,strong)NSArray * imageArray;

@end

@implementation ATMineViewController

-(NSArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = @[@[@""],@[@"VIP",@"余额"],@[@"我的课程",@"优惠券",@"爱提提商城"],@[@"下载管理",@"卡牌成就",@"学习记录",@"收藏、错题、笔记",@"评论与留言"],@[@"在线客服",@"帮助中心",@"设置"]];
    }
    return _dataArray;
}
-(NSArray *)imageArray{
    if (_imageArray == nil) {
        _imageArray = @[@[@""],@[@"mine_vip",@"mine_money"],@[@"mine_course",@"mine_coupon",@"mine_shop"],@[@"mine_downing",@"mine_achievement",@"mine_record",@"mine_collection",@"mine_comment"],@[@"mine_custom",@"mine_help",@"mine_setting"]];
    }
    return _imageArray;
}

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView removeEmptyCellRows];
    [self.view addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

#pragma mark - tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray * arr = self.dataArray[section];
    return arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        ATMineHeaderCell * cell = [tableView dequeueReusableCellWithIdentifier:@"mineHeader"];
        if (cell == nil) {
            cell = [[ATMineHeaderCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mineHeader"];
        }
        return cell;
    }else{
        UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"mine"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mine"];
        }
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = self.dataArray[indexPath.section][indexPath.row];
        cell.textLabel.font = kFONT15;
        cell.imageView.image = IMAGE(self.imageArray[indexPath.section][indexPath.row]);
        return cell;
    }
}
//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 2;
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view ;
}
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}
//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {//个人信息
        ATLoginViewController * VC = [ATLoginViewController new];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {//VIP
            ATVIPViewController * VC = [ATVIPViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row == 1){//余额
            ATMineMoneyViewController * VC = [ATMineMoneyViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {//我的课程
            ATMineCourceViewController * VC = [ATMineCourceViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row == 1){//优惠券
            ATMinCouponViewController * VC = [ATMinCouponViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row == 2){//爱提提商城
            //
            ATFriendPayViewController * VC = [ATFriendPayViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {//下载管理
            ATMineDownloadViewController * VC = [ATMineDownloadViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row == 1){//卡牌成就
            ATMineAchieveViewController * VC = [ATMineAchieveViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row == 2){//学习记录
            ATMineStudyViewController * VC = [ATMineStudyViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row == 3){//收藏、错题、笔记
            ATMineCENViewController * VC = [ATMineCENViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row == 4){//评论与留言
            ATMineCommentViewController * VC = [ATMineCommentViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }else if (indexPath.section == 4){
        if (indexPath.row == 0) {//在线客服
            //
        }else if (indexPath.row == 1){//帮助中心
            ATMineHelpViewController * VC = [ATMineHelpViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }else if (indexPath.row == 2){//设置
            ATMineSettingViewController * VC = [ATMineSettingViewController new];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
}

@end
