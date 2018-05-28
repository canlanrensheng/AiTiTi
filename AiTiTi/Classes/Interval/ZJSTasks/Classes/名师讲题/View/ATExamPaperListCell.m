//
//  ATExamPaperListCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/28.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATExamPaperListCell.h"

@implementation ATExamPaperListCell

-(void)awakeFromNib{
    [super awakeFromNib];
    self.difficultTypeLabel.clipsToBounds = YES;
    self.difficultTypeLabel.layer.cornerRadius = 9.5f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
