//
//  ATStudentRecommendViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/31.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATStudentRecommendViewController.h"
#import "ATBaseRecommondPlanViewController.h"
#import <ZXSegmentController/ZXSegmentController.h>
@interface ATStudentRecommendViewController ()

@property (nonatomic,weak) ZXSegmentController* segmentController;

@end

@implementation ATStudentRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews{
    
    NSMutableArray *controllerArray = [NSMutableArray array];
    for(int i = 0; i < 8;i++){
        ATBaseRecommondPlanViewController *planVC = [[ATBaseRecommondPlanViewController alloc] init];
        planVC.view.backgroundColor = RGB(240, 240, 240);
        [controllerArray addObject:planVC];
    }
    
    NSArray* names = @[@"头条",@"视频",@"娱乐",@"体育",@"段子",@"新时代",@"本地",@"网易号"];
    
    ZXSegmentController* segmentController = [[ZXSegmentController alloc] initWithControllers:controllerArray
                                                                               withTitleNames:names
                                                                             withDefaultIndex:0
                                                                               withTitleColor:RGB(51, 51, 51)
                                                                       withTitleSelectedColor:RGB(24, 208, 251)
                                                                              withSliderColor:RGB(24, 208, 251)];
    [self addChildViewController:(_segmentController = segmentController)];
    [self.view addSubview:segmentController.view];
    [segmentController didMoveToParentViewController:self];
    
}

- (void)tx_loadData{
    
}

- (void)tx_bindViewModel{
    
}

@end
