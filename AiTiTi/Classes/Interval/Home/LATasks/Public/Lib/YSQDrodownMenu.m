//
//  YSQDrodownMenu.m
//  LACarry
//
//  Created by LACarry on 16/6/1.
//  Copyright © 2016年 LACarry. All rights reserved.
//

#import "YSQDrodownMenu.h"

@interface YSQDrodownMenu ()

@end

@implementation YSQDrodownMenu

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        UIButton *bgview = [[UIButton alloc] init];
        bgview.frame = self.bounds;
        bgview.backgroundColor = [UIColor blackColor];
        bgview.alpha = 0;
        [self addSubview:bgview];
        self.bgview = bgview;
    }
    return self;
}

+ (instancetype)menu {
    return [[self alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)setContent:(UIView *)content {
    _content = content;
    [self addSubview:content];
}

- (void)setContentController:(UIViewController *)contentController {
    _contentController = contentController;
    self.content = contentController.view;
    NSLog(@"%@", self.class);
}

- (void)show {
    w = [UIApplication sharedApplication].keyWindow;
    w.hidden = NO;
    w.userInteractionEnabled = YES;
    // 2.添加自己到窗口上
    self.frame = w.bounds;
    [_bgview addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    _bgview.alpha = 0;

    self.content.y = [UIScreen mainScreen].bounds.size.height;
    [UIView animateWithDuration:0.4 animations:^{
        self.content.y = self.contentY;
        _bgview.alpha = 0.4;
    }                completion:^(BOOL finished) {

    }];
    [w addSubview:self];
}

/**
 *  销毁
 */
- (void)dismiss {
    if (self.delegate && [self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]) {
        [self.delegate dropdownMenuDidDismiss:self];
    }

    [UIView animateWithDuration:0.2 animations:^{
        self.content.y = [UIScreen mainScreen].bounds.size.height;
        _bgview.alpha = 0;
    }                completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}

- (void)showAlert {
    w = [UIApplication sharedApplication].keyWindow;
    w.hidden = NO;
    w.userInteractionEnabled = YES;
    // 2.添加自己到窗口上
    [w addSubview:self];
    self.frame = w.bounds;
    _bgview.alpha = 0;
    [_bgview addTarget:self action:@selector(dismissAlert) forControlEvents:UIControlEventTouchUpInside];
    self.content.layer.masksToBounds = YES;
    self.content.layer.cornerRadius = 5;
    self.content.center = w.center;
    self.content.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
    [UIView animateWithDuration:0.2f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
        _bgview.alpha = 0.5;
        self.content.transform = CGAffineTransformMakeScale(1.05f, 1.05f);

    }                completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1f delay:0.f options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.content.transform = CGAffineTransformIdentity;
        }                completion:nil];
    }];
}

- (void)dismissAlert {
//    if (self.delegate &&[self.delegate respondsToSelector:@selector(dropdownMenuDidDismiss:)]) {
//        [self.delegate dropdownMenuDidDismiss:self];
//    }
    _bgview.alpha = 0;
    [self removeFromSuperview];
}
@end
