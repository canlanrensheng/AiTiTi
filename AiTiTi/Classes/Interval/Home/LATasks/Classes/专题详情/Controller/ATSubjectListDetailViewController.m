//
//  ATSubjectListDetailViewController.m
//  AiTiTi
//
//  Created by LA on 2018/6/7.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubjectListDetailViewController.h"
#import "ATSubjectListDetailCell.h"
#import "ATSectionHeader.h"

@interface ATSubjectListDetailViewController ()

@end

@implementation ATSubjectListDetailViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStylePlain;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews {
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATSubjectListDetailCell *cell = [ATSubjectListDetailCell getTableView:tableView forIndexPath:indexPath];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        ATSectionHeader *sectionHeader = [ATSectionHeader sectionHeaderWithImage:[UIImage imageNamed:@""] title:@"方法" subTitle: nil];
        
        return sectionHeader;
    }else {
        ATSectionHeader *sectionHeader = [ATSectionHeader sectionHeaderWithImage:[UIImage imageNamed:@""] title:@"技巧" subTitle: nil];
        
        return sectionHeader;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 153;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
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
