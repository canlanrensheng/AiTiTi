//
//  ATProjectTitleViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/4.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATProjectTitleViewController.h"
#import "ATAddProjectTitleViewController.h"
@interface ATProjectTitleViewController ()

@end

@implementation ATProjectTitleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ATAddProjectTitleViewController *addProjectVC = [[ATAddProjectTitleViewController alloc] init];
    [self.navigationController pushViewController:addProjectVC animated:YES];
}

@end
