//
//  FNTipsView.m
//  LikeFeiNiuShopApp
//
//  Created by jimmy on 16/8/31.
//  Copyright © 2016年 jimmy. All rights reserved.
//

#import "FNTipsView.h"

@interface FNTipsView ()
@property (nonatomic, strong) UILabel *tipLabel;
@end
@implementation FNTipsView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
- (instancetype)initWithTips:(NSString *)tips
{
    self = [super init];
    if (self) {
        [self createTips:tips];
    }
    return self;
}
- (void)createTips:(NSString *)tips
{
    _tipLabel = [UILabel new];
    _tipLabel.font = kFONT15;
    _tipLabel.text = tips;
    _tipLabel.textColor = [UIColor whiteColor];
    [_tipLabel sizeToFit];
    _tipLabel.frame = CGRectMake(4, 4, _tipLabel.frame.size.width, _tipLabel.frame.size.height);
    
    self.frame = CGRectMake(0, 0, _tipLabel.frame.size.width+20, _tipLabel.frame.size.height+20);
    _tipLabel.center = self.center;
    self.layer.cornerRadius = 3.0;
    self.center = CGPointMake(ATScreenWidth/2, ATScreenHeight/2);
    self.backgroundColor = [UIColor blackColor];
    [self addSubview:_tipLabel];

}
- (void)showWithDuration:(CGFloat)duration
{
    CGFloat durationTime = 0;
    if (duration == 0) {
        durationTime = 0.4;
    }else{
        durationTime = duration;
    }
    //添加到keyWindow上
    __weak typeof (self) weakSelf = self;
    [ATKeyWindow addSubview:self];
    [UIView animateWithDuration:duration animations:^{
        weakSelf.transform = CGAffineTransformMakeScale(0.5, 0.5);
    } completion:^(BOOL finished) {
        if (finished) {
            [UIView animateWithDuration:duration animations:^{
                weakSelf.transform = CGAffineTransformMakeScale(1.2, 1.2);
            }];
        }
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:durationTime animations:^{
            weakSelf.transform = CGAffineTransformIdentity;
            weakSelf.alpha = 0.0;
            
        }  completion:^(BOOL finished) {
            if(finished)
            {
                [weakSelf removeFromSuperview];
            }
        }];


    });


}
+ (void)showTips:(NSString *)tips
{
    FNTipsView* tipView = [[FNTipsView alloc] initWithTips:tips];
    [tipView showWithDuration:0];
}
+ (void)showTips:(NSString *)tips withDuration:(CGFloat)duration
{
    FNTipsView* tipView = [[FNTipsView alloc] initWithTips:tips];
    [tipView showWithDuration:duration];
}
@end
