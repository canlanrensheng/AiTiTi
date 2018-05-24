//
//  ATSelectGradeBtn.m
//  AiTiTi
//
//  Created by 童城 on 2018/4/25.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSelectGradeBtn.h"

@implementation ATSelectGradeBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x = self.width * 0.15;
    self.titleLabel.y = 0;
    self.titleLabel.width = self.width * 0.5;
    self.titleLabel.height = self.height;
    
    self.imageView.x = self.titleLabel.right;
    self.imageView.centerY = self.titleLabel.centerY;
    self.imageView.width = 10;
    self.imageView.height = 7;
    
}



@end
