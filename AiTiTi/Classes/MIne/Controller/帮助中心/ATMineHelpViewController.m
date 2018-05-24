//
//  ATMineHelpViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/11.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineHelpViewController.h"
#import "ATMineHelpCell.h"

@interface ATMineHelpViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@end

@implementation ATMineHelpViewController

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"常见问题";
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
    ATMineHelpCell * cell = [tableView dequeueReusableCellWithIdentifier:@"help"];
    if (cell == nil) {
        cell = [[ATMineHelpCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"help"];
    }
    return cell;
}

@end
