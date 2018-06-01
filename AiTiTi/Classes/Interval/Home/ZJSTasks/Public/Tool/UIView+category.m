//
//  UIView+category.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/31.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "UIView+category.h"

@implementation UIView (category)

- (void)clipWithCornerRadius:(CGFloat)cornerRadius borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}

@end
