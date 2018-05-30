//
//  ATStudyPlanReusableView.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATStudyPlanReusableView.h"

@implementation ATStudyPlanReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.classButton.clipsToBounds = YES;
    self.classButton.layer.cornerRadius = 12.5f;
    self.classButton.layer.borderColor = RGBCOLOR(51, 51, 51).CGColor;
    self.classButton.layer.borderWidth = 1.0f;
  
}

@end
