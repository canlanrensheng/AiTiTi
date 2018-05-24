//
//  ATHomeRecommendCell.m
//  AiTiTi
//
//  Created by 童城 on 2018/4/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATHomeRecommendCell.h"
#import "ATKeyPointView.h"

@implementation ATHomeRecommendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    ATKeyPointView *keypointView = [[ATKeyPointView alloc] initWithFrame:CGRectMake(0, 0, ATScreenWidth, 200)];
    [self.contentView addSubview:keypointView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
