//
//  ATAddTitleCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/5.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATAddTitleCell.h"

@implementation ATAddTitleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self.backView clipWithCornerRadius:5.0 borderColor:[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1.0f]   borderWidth:0.5];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
