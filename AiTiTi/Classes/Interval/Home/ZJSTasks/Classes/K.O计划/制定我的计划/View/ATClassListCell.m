//
//  ATClassListCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATClassListCell.h"

@implementation ATClassListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.numLabel clipWithCornerRadius:9.5 borderColor:nil borderWidth:0];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
