//
//  ATHeaderBtn.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/5.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATHeaderBtn.h"

@implementation ATHeaderBtn

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.adjustsImageWhenHighlighted = NO;
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.x = 0;
    self.titleLabel.height = 30;
    self.titleLabel.y = self.height - self.titleLabel.height;
    self.titleLabel.width = self.width;
    
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.height = self.height - self.titleLabel.height;
    self.imageView.width = self.imageView.height;
}

+ (ATHeaderBtn *)buttonWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title target:(id)target selector:(SEL)selector {
    ATHeaderBtn *btn = [[self alloc] initWithFrame:frame];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setImage:image forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return btn;
}


@end
