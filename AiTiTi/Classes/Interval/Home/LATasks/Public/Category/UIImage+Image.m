//
//  UIImage+Image.m
//  
//
//  Created by yz on 15/7/6.
//  Copyright (c) 2015年 yz. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)
+(UIImage *)compressImageWith:(UIImage *)image

{
    
    float imageWidth = image.size.width;
    
    float imageHeight = image.size.height;
    
    float width = 640;
    
    float height = image.size.height/(image.size.width/width);
    
    float widthScale = imageWidth /width;
    
    float heightScale = imageHeight /height;
    
    // 创建一个bitmap的context
    
    // 并把它设置成为当前正在使用的context
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    
    if (widthScale > heightScale) {
        
        [image drawInRect:CGRectMake(0, 0, imageWidth /heightScale , height)];
        
    }
    
    else {
        
        [image drawInRect:CGRectMake(0, 0, width , imageHeight /widthScale)];
        
    }
    
    // 从当前context中创建一个改变大小后的图片
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 使当前的context出堆栈
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}


+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (instancetype)captureWithView:(UIView *)view
{
    // 1.开启上下文
    UIGraphicsBeginImageContextWithOptions(view.frame.size, NO, 0.0);
    
    // 2.将控制器view的layer渲染到上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 3.取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.结束上下文
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)imageWithName:(NSString *)name
{
    UIImage *image = nil;
//    if (iOS7) { // 处理iOS7的情况
//        NSString *newName = [name stringByAppendingString:@"_os7"];
//        image = [UIImage imageNamed:newName];
//    }
    
    if (image == nil) {
        image = [UIImage imageNamed:name];
    }
    return image;
}

+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageWithName:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

+ (UIImage *) imageWithURLString:(NSString *)url {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString: url]];
    return [UIImage imageWithData:data];
}

+ (CGFloat)imageHeightWithScaleScreenWidth:(NSString *)urlString {
    return [[UIImage imageWithURLString:urlString] scaleWithFixedWidth:Screen_Width].size.height;
}

@end
