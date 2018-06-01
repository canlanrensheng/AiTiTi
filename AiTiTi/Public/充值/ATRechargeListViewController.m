//
//  ATRechargeListViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/13.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATRechargeListViewController.h"
#import "ATRechargeListCell.h"

@interface ATRechargeListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@end

@implementation ATRechargeListViewController

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = ATWhite;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATRechargeListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"rechargeList"];
    if (cell == nil) {
        cell = [[ATRechargeListCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"rechargeList"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
