//
//  ATDifficultyDistributionCell.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/29.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATDifficultyDistributionCell.h"

@implementation ATDifficultyDistributionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backView.clipsToBounds = YES;
    self.backView.layer.cornerRadius = 5.0f;
    self.backView.layer.borderColor = RGBCOLOR(45, 180, 255).CGColor;
    self.backView.layer.borderWidth = 1.0f;
}


@end
