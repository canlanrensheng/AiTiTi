//
//  ATDirectoryViewController.m
//  AiTiTi
//
//  Created by LA on 2018/5/29.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATDirectoryViewController.h"
#import "ATDirectoryCell.h"
#import "ATSectionHeader.h"

@interface ATDirectoryViewController ()

@end

@implementation ATDirectoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else {
        return 4;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATDirectoryCell *cell = [ATDirectoryCell getTableView:tableView forIndexPath:indexPath];
    cell.indexPath = indexPath;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ATSectionHeader *sectionHeader;
    if (section == 0) {
        ATSectionHeader *platformHeader = [ATSectionHeader sectionHeaderWithImage:IMAGE(@"section_header_blue") title:@"纲领视频" subTitle:nil];
        sectionHeader = platformHeader;
    }else {
        ATSectionHeader *sampleHeader = [ATSectionHeader sectionHeaderWithImage:IMAGE(@"section_header_org") title:@"例题视频" subTitle:nil];
        sectionHeader = sampleHeader;
    }
    return sectionHeader;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
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
