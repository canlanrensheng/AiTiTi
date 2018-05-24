//
//  ATMineDownloadViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/20.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineDownloadViewController.h"
#import "ATSubSelectView.h"
#import "ATDownloadCell.h"

#include <sys/param.h>
#include <sys/mount.h>

@interface ATMineDownloadViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView * tableView;

@end

@implementation ATMineDownloadViewController

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
    subView.titleLabel.text = @"下载管理";
    subView.backBlock = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
    [topView addSubview:subView];
    
    [subView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.backgroundColor = ATWhite;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView removeEmptyCellRows];
    [self.view addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 0, 30, 0) excludingEdge:ALEdgeTop];
    [self.tableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:10];
    
    UILabel * dickLabel = [UILabel new];
    dickLabel.text = [self freeDiskSpaceInBytes];
    dickLabel.font = kFONT10;
    dickLabel.textColor = ATGray;
    [self.view addSubview:dickLabel];
    
    [dickLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [dickLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
}

#pragma mark - tableViewDelegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATDownloadCell * cell = [tableView dequeueReusableCellWithIdentifier:@"download"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ATDownloadCell" owner:nil options:nil] firstObject];
    }
    return cell;
}

- (NSString *)freeDiskSpaceInBytes{
    struct statfs buf;
    float freeSpace = -1;
    if (statfs("/var", &buf) >= 0) {
        freeSpace = (buf.f_bsize * buf.f_bavail);
    }
    NSString *str = [NSString stringWithFormat:@"手机剩余存储空间为：%0.2f G",freeSpace/1024/1024/1024];
    return str;
}

@end
