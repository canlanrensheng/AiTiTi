//
//  ATMineCourceViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/9.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineCourceViewController.h"
#import "ATMineCourceCell.h"
#import "ATSubSelectView.h"

@interface ATMineCourceViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@end

@implementation ATMineCourceViewController

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
    UIView * topView = [UIView new];
    [self.view addSubview:topView];
    
    [topView autoSetDimension:ALDimensionHeight toSize:40];
    [topView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(statusbarH, 0, 0, 0) excludingEdge:ALEdgeBottom];
    
    ATSubSelectView * subView = [ATSubSelectView new];
    subView.titleLabel.text = @"我的课程";
    subView.backBlock = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
    [topView addSubview:subView];
    
    [subView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = ATWhite;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 0, 10) excludingEdge:ALEdgeTop];
    [self.tableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:10];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATMineCourceCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cource"];
    if (cell == nil) {
        cell = [[ATMineCourceCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cource"];
    }
    return cell;
}
//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view ;
}
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

@end
