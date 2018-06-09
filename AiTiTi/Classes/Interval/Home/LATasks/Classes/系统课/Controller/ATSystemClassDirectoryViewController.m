//
//  ATSystemClassDirectoryViewController.m
//  AiTiTi
//
//  Created by LA on 2018/6/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSystemClassDirectoryViewController.h"
#import "ATDirectoryCell.h"
#import "ATSectionHeader.h"

@interface ATSystemClassDirectoryViewController ()

@end

@implementation ATSystemClassDirectoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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


@end
