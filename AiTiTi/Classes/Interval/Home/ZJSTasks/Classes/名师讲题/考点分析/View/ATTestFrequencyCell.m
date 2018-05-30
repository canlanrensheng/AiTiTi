//
//  ATTestFrequencyCell.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/29.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTestFrequencyCell.h"

@implementation ATTestFrequencyCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.backView.clipsToBounds = YES;
    self.backView.layer.cornerRadius = 5.0f;
    self.backView.layer.borderColor = RGBCOLOR(9, 204, 145).CGColor;
    self.backView.layer.borderWidth = 1.0;
    self.testFrequencyTextLabel.clipsToBounds = YES;
    self.testFrequencyTextLabel.layer.cornerRadius = 9.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
