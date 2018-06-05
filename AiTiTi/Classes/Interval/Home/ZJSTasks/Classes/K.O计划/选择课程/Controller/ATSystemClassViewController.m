//
//  ATSystemClassViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/4.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSystemClassViewController.h"
#import "ATAddSystemClassViewController.h"
@interface ATSystemClassViewController ()

@end

@implementation ATSystemClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ATAddSystemClassViewController *addProjectVC = [[ATAddSystemClassViewController alloc] init];
    [self.navigationController pushViewController:addProjectVC animated:YES];
}

@end
