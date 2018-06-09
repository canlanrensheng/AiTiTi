//
//  UIImage+Image.h
//  
//
//  Created by yz on 15/7/6.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+ImageEffects.h"

@interface UIImage (Image)


// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;


// 将一个view截图
+ (instancetype)captureWithView:(UIView *)view;

/**
 *  根据图片名自动加载适配iOS6\7的图片
 */
+ (UIImage *)imageWithName:(NSString *)name;

/**
 *  根据图片名返回一张能够自由拉伸的图片
 */
+ (UIImage *)resizedImage:(NSString *)name;

+ (UIImage *)compressImageWith:(UIImage *)image;

+ (UIImage *) imageWithURLString:(NSString *)url;

+ (CGFloat)imageHeightWithScaleScreenWidth:(NSString *)urlString;
@end
