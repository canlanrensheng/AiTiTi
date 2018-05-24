//
//  ATMineCommentViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/16.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineCommentViewController.h"
#import "ATSubSelectView.h"
#import "ATMineCommentCell.h"

@interface ATMineCommentViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation ATMineCommentViewController

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
    subView.titleLabel.text = @"我的评论";
    subView.backBlock = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
    [topView addSubview:subView];
    
    [subView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = ATWhite;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.tableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:10];
}

#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATMineCommentCell * cell = [tableView dequeueReusableCellWithIdentifier:@"comment"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ATMineCommentCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

@end
