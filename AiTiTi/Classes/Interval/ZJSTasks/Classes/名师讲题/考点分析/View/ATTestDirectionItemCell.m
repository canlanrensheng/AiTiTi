//
//  ATTestDirectionItemCell.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/29.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTestDirectionItemCell.h"

@implementation ATTestDirectionItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.numLabel.clipsToBounds = YES;
    self.numLabel.layer.cornerRadius = 7.5;
    self.numLabel.layer.borderWidth = 1.0f;
    self.numLabel.layer.borderColor = RGB(150, 150, 150).CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
