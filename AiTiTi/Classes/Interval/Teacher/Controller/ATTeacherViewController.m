//
//  ATTeacherViewController.m
//  AiTiTi
//
//  Created by 童城 on 2018/4/23.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTeacherViewController.h"
#import "ATTeacherNavBar.h"
#import "ATTeacherCell.h"
#import "ATTeacherDetailController.h"

@interface ATTeacherViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

static NSString *const teacherCellID = @"ATTeacherCell";

@implementation ATTeacherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.hidden = YES;
    // 使用自定义导航栏
    ATTeacherNavBar *teacherNavBar = [ATTeacherNavBar teacherNavBar];
    [self.view addSubview:teacherNavBar];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, teacherNavBar.bottom, ATScreenWidth, ATScreenHeight - teacherNavBar.height) style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATTeacherCell class]) bundle:nil] forCellReuseIdentifier:teacherCellID];
    [self.view addSubview:tableView];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    ATTeacherCell *teacherCell = [tableView dequeueReusableCellWithIdentifier:teacherCellID];
    teacherCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return teacherCell;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 326;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    ATTeacherDetailController *detailVC = [[ATTeacherDetailController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
