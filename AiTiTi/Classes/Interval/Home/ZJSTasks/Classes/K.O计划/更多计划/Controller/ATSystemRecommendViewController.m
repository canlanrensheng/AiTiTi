//
//  ATSystemRecommendViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/31.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSystemRecommendViewController.h"
#import "ATBaseSystemRecommondPlanViewController.h"
#import <ZXSegmentController/ZXSegmentController.h>
#import "ATPlanDetailViewController.h"
@interface ATSystemRecommendViewController ()

@property (nonatomic,weak) ZXSegmentController* segmentController;

@end

@implementation ATSystemRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews{
    
    NSMutableArray *controllerArray = [NSMutableArray array];
    for(int i = 0; i < 8;i++){
        ATBaseSystemRecommondPlanViewController *planVC = [[ATBaseSystemRecommondPlanViewController alloc] init];
        planVC.view.backgroundColor = [UIColor whiteColor];
        [controllerArray addObject:planVC];
    }
    
    NSArray* names = @[@"头条",@"视频",@"娱乐",@"体育",@"段子",@"新时代",@"本地",@"网易号"];
    
    ZXSegmentController* segmentController = [[ZXSegmentController alloc] initWithControllers:controllerArray
                                                                               withTitleNames:names
                                                                             withDefaultIndex:0
                                                                               withTitleColor:RGB(153, 153, 153)
                                                                       withTitleSelectedColor:RGB(34, 208, 144)
                                                                              withSliderColor:RGB(34, 208, 144)];
    [self addChildViewController:(_segmentController = segmentController)];
    [self.view addSubview:segmentController.view];
    [segmentController didMoveToParentViewController:self];
    
}

- (void)tx_loadData{
    
}

- (void)tx_bindViewModel{
    
}

@end
