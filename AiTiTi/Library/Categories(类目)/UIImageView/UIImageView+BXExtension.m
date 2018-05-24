//
//  UIImageView+BXExtension.m
//  JYJ不得姐
//
//  Created by JYJ on 16/5/4.
//  Copyright © 2016年 baobeikeji. All rights reserved.
//

#import "UIImageView+BXExtension.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (BXExtension)
- (void)setHeader:(NSString *)url
{
    UIImage *placeholder = [[UIImage createImageWithColor:[UIColor redColor]] circleImage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image ? [image circleImage] : placeholder;
    }];
}

- (void)setUrlImg:(NSString *)url
{
    UIImage *placeholder = [UIImage createImageWithColor:[UIColor redColor]];
    
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if (cacheType == SDImageCacheTypeNone || cacheType == SDImageCacheTypeDisk) {
            self.image = image;
            self.alpha = 0;
//            self.scale = 1.f;
            [UIView animateWithDuration:1 animations:^{
                self.alpha = 1.f;
//                self.scale = 1.f;
            }];
        } else {
            
            self.image = image;
            self.alpha = 1.f;
//            self.scale = 1.f;
        }
    }];

}

@end
