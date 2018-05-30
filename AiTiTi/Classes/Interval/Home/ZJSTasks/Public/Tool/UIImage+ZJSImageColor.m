//
//  UIImage+ZJSImageColor.m
//  截取字符串
//
//  Created by 张金山 on 2017/4/27.
//  Copyright © 2017年 张金山. All rights reserved.
//

#import "UIImage+ZJSImageColor.h"

@implementation UIImage (ZJSImageColor)
//
+ (UIImage *)ZJS_imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

@end
