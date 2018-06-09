//
//  ATStudyPlanListCell.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATStudyPlanListCell.h"

@implementation ATStudyPlanListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    

    
    [self clipWithCornerRadius:5 borderColor:[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1.0f] borderWidth:0.5];
    
    self.classNameLabel.clipsToBounds = YES;
    self.classNameLabel.layer.cornerRadius = 3.0f;

}

@end
