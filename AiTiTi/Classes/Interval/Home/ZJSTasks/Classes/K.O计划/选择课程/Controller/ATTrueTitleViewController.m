//
//  ATTrueTitleViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/4.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTrueTitleViewController.h"
#import "ATAddTitleViewController.h"
@interface ATTrueTitleViewController ()

@end

@implementation ATTrueTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ATAddTitleViewController *addProjectVC = [[ATAddTitleViewController alloc] init];
    [self.navigationController pushViewController:addProjectVC animated:YES];
}

@end
