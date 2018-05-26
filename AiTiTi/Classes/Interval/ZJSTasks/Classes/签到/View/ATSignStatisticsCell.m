//
//  ATSignStatisticsCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSignStatisticsCell.h"

@implementation ATSignStatisticsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backImageView.clipsToBounds = YES;
    self.backImageView.layer.cornerRadius = 3.0f;
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
