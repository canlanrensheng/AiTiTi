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
    
//    [self.classButton setTitle:@"数学" forState:UIControlStateNormal];
    [self.classButton setImage:[UIImage imageNamed:@"subject_black_arrow_down"] forState:UIControlStateNormal];
    self.classButton.titleEdgeInsets = UIEdgeInsetsMake(0, -self.classButton.imageView.bounds.size.width- 2, 0, self.classButton.imageView.bounds.size.width);
    self.classButton.imageEdgeInsets = UIEdgeInsetsMake(0, self.classButton.titleLabel.bounds.size.width, 0, -self.classButton.titleLabel.bounds.size.width);
  
}

@end
