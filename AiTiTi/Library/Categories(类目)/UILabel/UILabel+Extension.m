//
//  UILabel+Extension.m
//  Weibo11
//
//  Created by JYJ on 15/12/5.
//  Copyright © 2015年 itheima. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize {
    return [self labelWithTitle:title color:color fontSize:fontSize alignment:NSTextAlignmentCenter];
}

+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[UILabel alloc] init];
    
    label.text = title;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    [label sizeToFit];
    
    return label;
}

+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font {
    return [self labelWithTitle:title color:color font:font alignment:NSTextAlignmentCenter];
}

+ (instancetype)labelWithTitle:(NSString *)title color:(UIColor *)color font:(UIFont *)font alignment:(NSTextAlignment)alignment {
    
    UILabel *label = [[UILabel alloc] init];
    label.text = title;
    label.textColor = color;
    label.font = font;
    label.numberOfLines = 0;
    label.textAlignment = alignment;
    [label sizeToFit];
    return label;
}


- (void)addAttchmentImage:(UIImage *)image andBounds:(CGRect)rect atIndex:(NSInteger)index{
    NSTextAttachment* attchment = [NSTextAttachment new];
    attchment.image = image;
    attchment.bounds = rect;
    NSAttributedString *att = [NSAttributedString attributedStringWithAttachment:attchment];
    NSMutableAttributedString* matt = [[NSMutableAttributedString alloc]initWithString:self.text];
    [matt insertAttributedString:att atIndex:index];
    self.attributedText = matt;
}
- (void)addSingleAttributed:(NSDictionary *)att ofRange:(NSRange)range{
    NSMutableAttributedString* matt = [[NSMutableAttributedString alloc]initWithString:self.text];
    [matt addAttributes:att range:range];
    self.attributedText = matt;
}

@end
