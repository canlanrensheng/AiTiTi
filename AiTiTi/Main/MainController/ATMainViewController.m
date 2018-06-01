//
//  ATMainViewController.m
//  AiTiTi
//
//  Created by 云辉 on 2018/4/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMainViewController.h"
#import "ATNavigationController.h"

#import "ATHomeViewController.h"
#import "ATTeacherViewController.h"
#import "ATIntervalViewController.h"
#import "ATMineViewController.h"

@interface ATMainViewController ()

@end

@implementation ATMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializedSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - initializedSubviews
- (void)initializedSubviews{
    ATHomeViewController * home = [ATHomeViewController new];
    [self setUpSingleChildController:home title:@"首页" imageName:@"tab_home" seleceImageName:@"tab_home_select"];
    
    ATTeacherViewController *teacher = [ATTeacherViewController new];
    [self setUpSingleChildController:teacher title:@"名师" imageName:@"tab_teacher" seleceImageName:@"tab_teacher_select"];
    
    ATIntervalViewController *interval = [ATIntervalViewController new];
    [self setUpSingleChildController:interval title:@"课间" imageName:@"tab_break" seleceImageName:@"tab_break_select"];
    
    ATMineViewController *mine = [ATMineViewController new];
    [self setUpSingleChildController:mine title:@"我的" imageName:@"tab_mine" seleceImageName:@"tab_mine_select"];
}
- (void)setUpSingleChildController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    controller.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage =  [[UIImage imageNamed:selectImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
//    包装导航控制器
    ATNavigationController *nav = [[ATNavigationController alloc] initWithRootViewController:controller];
    
    [self addChildViewController:nav];
}

@end
