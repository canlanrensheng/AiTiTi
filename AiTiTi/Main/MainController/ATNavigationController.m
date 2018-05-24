//
//  ATNavigationController.m
//  AiTiTi
//
//  Created by 云辉 on 2018/4/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATNavigationController.h"

@interface ATNavigationController ()<UINavigationControllerDelegate>

@end

@implementation ATNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.tintColor = RGB(104,105,106);
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count ) {
        viewController.hidesBottomBarWhenPushed = YES;

        UIBarButtonItem *backToLastPage = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"return"] style:UIBarButtonItemStyleDone target:self action:@selector(popAction)];
        viewController.navigationItem.leftBarButtonItem = backToLastPage;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark - popAction
- (void)popAction{
    [self popViewControllerAnimated:YES];
}

@end
