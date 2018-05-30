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
    

    self.layer.cornerRadius = 5;
    self.layer.borderColor = [[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1.0f] CGColor];
    self.layer.borderWidth = 0.5;
    self.layer.backgroundColor = [[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f] CGColor];
    self.alpha = 1;
}

@end
