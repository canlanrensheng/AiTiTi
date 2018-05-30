//
//  ATPullDownCell.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATPullDownCell.h"

@implementation ATPullDownCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (isSelected) {
//        self.itemTitleLabel.textColor = KDefaultColor;
//        self.backgroundColor = kCellBgColor;
        self.gouImageView.hidden = NO;
    }else
    {
//        self.textLabel.textColor = [UIColor lightGrayColor];
        self.gouImageView.hidden = YES;
//        self.backgroundColor=[UIColor groupTableViewBackgroundColor];
    }
}

@end
