//
//  ATStudentRecommondCell.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/6/1.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATStudentRecommondCell.h"

@implementation ATStudentRecommondCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self clipWithCornerRadius:5 borderColor:[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1.0f] borderWidth:0.5];
    
    self.classNameLabel.clipsToBounds = YES;
    self.classNameLabel.layer.cornerRadius = 3.0f;
    
    [self.iconImageView clipWithCornerRadius:13.5 borderColor:nil
                                 borderWidth:0];
}

@end
