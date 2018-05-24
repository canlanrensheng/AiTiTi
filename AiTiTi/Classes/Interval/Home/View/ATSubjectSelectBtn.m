//
//  ATSubjectSelectBtn.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/19.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubjectSelectBtn.h"

@implementation ATSubjectSelectBtn

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        self.layer.borderWidth = 1.0;
        self.layer.cornerRadius = 6.0;
        self.layer.masksToBounds = YES;
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

- (void)setHighlighted:(BOOL)highlighted {
    
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
