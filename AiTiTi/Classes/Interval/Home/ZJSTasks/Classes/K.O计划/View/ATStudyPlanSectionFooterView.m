//
//  ATStudyPlanSectionFooterView.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATStudyPlanSectionFooterView.h"
#import "ATMorePlanViewController.h"
@implementation ATStudyPlanSectionFooterView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.lookMoreBtn.clipsToBounds = YES;
    self.lookMoreBtn.layer.cornerRadius = 15.5;
    self.lookMoreBtn.layer.borderColor = RGB(221, 221, 221).CGColor;
    self.lookMoreBtn.layer.borderWidth = 1.0;
}

- (IBAction)lookMoreBtnClick:(id)sender {
    ATMorePlanViewController *morePlanVC = [[ATMorePlanViewController alloc] init];
    [VisibleViewController().navigationController pushViewController:morePlanVC animated:YES];
}
@end
