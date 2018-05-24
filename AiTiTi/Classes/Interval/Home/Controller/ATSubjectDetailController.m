//
//  ATSubjectDetailController.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/19.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubjectDetailController.h"

@interface ATSubjectDetailController ()<ATNavigationBarDelegate>

@end

@implementation ATSubjectDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ATNavigationBar *navBar = [[ATNavigationBar alloc] initWithTitle:@"专题" leftName:nil rightName:nil delegate:self];
    
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
