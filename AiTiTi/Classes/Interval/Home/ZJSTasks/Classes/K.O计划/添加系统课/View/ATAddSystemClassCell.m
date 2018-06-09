//
//  ATAddSystemClassCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/4.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATAddSystemClassCell.h"

@implementation ATAddSystemClassCell

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.backgroundColor = RGB(240, 240, 240);
    [self.backView clipWithCornerRadius:5.0 borderColor:[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1.0f]   borderWidth:0.5];

    [self.classNameLabel clipWithCornerRadius:3.0 borderColor:nil borderWidth:0];
    [self.iconImageView clipWithCornerRadius:12.5 borderColor:nil borderWidth:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
