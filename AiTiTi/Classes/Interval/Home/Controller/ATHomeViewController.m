//
//  ATHomeViewController.m
//  AiTiTi
//
//  Created by 云辉 on 2018/4/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATHomeViewController.h"
#import "ATSearchViewController.h"
#import "ATHomeNavBar.h"
#import "ATMessagesViewController.h"
#import "ATHomeMainCell.h"
#import "ATHomeRecommendCell.h"
#import "ATHomeHeader.h"
#import "ATSectionHeader.h"
#import "ATSubjectViewController.h"
#import "ATCourseController.h"
#import "ATTeacherExplainController.h"
#import "ATKOViewController.h"
#import "ATEvaluationViewController.h"

@interface ATHomeViewController ()<UITableViewDelegate,UITableViewDataSource,ATHomeHeaderBtnDelegate>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation ATHomeViewController
static NSString *const recommendCellID = @"recommendCell";
static NSString *const mainCellID = @"mainCell";

#pragma  mark - LazyLoading
- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    
    //导航栏
    ATHomeNavBar *homeBar = [ATHomeNavBar homeNavBar];
    [self.view addSubview:homeBar];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, homeBar.bottom, ATScreenWidth, ATScreenHeight - homeBar.height) style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATHomeRecommendCell class]) bundle:nil] forCellReuseIdentifier:recommendCellID];
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATHomeMainCell class]) bundle:nil] forCellReuseIdentifier:mainCellID];
    ATHomeHeader *header = [[ATHomeHeader alloc] initWithFrame:CGRectMake(0, 0, ATScreenWidth, 1)];
    header.delegate = self;
    tableView.tableHeaderView = header;
    
    [self.view addSubview:tableView];
    
//    [self requestData]; 
}

- (void)requestData {
    [[ATNetWorking sharedManager] getResultWithParameter:nil url:homeClassicTopics successBlock:^(id responseBody) {
        
        ATLog(@"data:%@",responseBody);
        [self.tableView reloadData];
        
    } failureBlock:^(NSString *error) {
        ATLog(@"error:%@",error);
        
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        ATHomeRecommendCell *recommendCell = [tableView dequeueReusableCellWithIdentifier:recommendCellID];
        cell = recommendCell;
        
    }else {
        ATHomeMainCell *mainCell = [tableView dequeueReusableCellWithIdentifier:mainCellID];
        cell = mainCell;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ATSectionHeader *sectionHeader;
    if (section == 0) {
        ATSectionHeader *keyPointHeader = [ATSectionHeader sectionHeaderWithImage:[UIImage imageNamed:@"section_header_blue"] title:@"重点推荐" subTitle: nil];
        sectionHeader = keyPointHeader;
    }else if (section == 1) {
        ATSectionHeader *systemHeader = [ATSectionHeader sectionHeaderWithImage:[UIImage imageNamed:@"section_header_org"] title:@"系统复习推荐" subTitle:@"更多复习推荐"];
        sectionHeader = systemHeader;
    }else if (section == 2) {
        ATSectionHeader *hotHeader = [ATSectionHeader sectionHeaderWithImage:[UIImage imageNamed:@"section_header_blue"] title:@"热门专题推荐" subTitle:@"更多专题推荐"];
        sectionHeader = hotHeader;
    }
    return sectionHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    }
    return 180;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma mark - ATHomeHeaderBtnDelegate
- (void)homeHeader:(ATHomeHeader *)homeHeader btnDidClicker:(UIButton *)btn {
    if ([btn.titleLabel.text isEqualToString:@"专题"]) {
        ATSubjectViewController *subjectVC = [[ATSubjectViewController alloc] init];
        [self.navigationController pushViewController:subjectVC animated:YES];
    }else if ([btn.titleLabel.text isEqualToString:@"系统课"]) {
        ATCourseController *courseVC = [[ATCourseController alloc] init];
        [self.navigationController pushViewController:courseVC animated:YES];
    }else if ([btn.titleLabel.text isEqualToString:@"名师讲题"]) {
        ATTeacherExplainController *teacherExplainVC = [[ATTeacherExplainController alloc] init];
        [self.navigationController pushViewController:teacherExplainVC animated:YES];
    }else if ([btn.titleLabel.text isEqualToString:@"K.O计划"]) {
        ATKOViewController *koVC = [[ATKOViewController alloc] init];
        [self.navigationController pushViewController:koVC animated:YES];
    }else if ([btn.titleLabel.text isEqualToString:@"评测"]) {
        ATEvaluationViewController *evaluationVC = [[ATEvaluationViewController alloc] init];
        [self.navigationController pushViewController:evaluationVC animated:YES];
    }
}

@end
