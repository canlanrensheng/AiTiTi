//
//  ATSignSuccessALertView.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSignSuccessALertView.h"
#define MYCOLOR(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
//#define PX (SWIDTH / 1242)

#import "ATSignAlertView.h"

@interface ATSignSuccessALertView()<UITextFieldDelegate>{
    UIView *_bgView;
    UIView *_alertView;
}

@end

@implementation ATSignSuccessALertView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //背景图
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sureBtnClick)];
        [_bgView addGestureRecognizer:tap];
        _bgView.userInteractionEnabled = YES;
        _bgView.backgroundColor = MYCOLOR(0, 0, 0, 0.6);
        [self addSubview:_bgView];
        CGFloat totalHeight = 288 + 38 + 80;
        //弹出视图
        UIView *alertView = [[UIView alloc] init];
        alertView.centerY = _bgView.centerY;
        UITapGestureRecognizer * alertTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sureBtnClick)];
        alertView.userInteractionEnabled = YES;
        [alertView addGestureRecognizer:alertTap];
        [alertView setBackgroundColor:[UIColor clearColor]];
        alertView.layer.cornerRadius = 6.0f;
        alertView.clipsToBounds = YES;
        [_bgView addSubview:alertView];
        [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_bgView);
         make.left.equalTo(_bgView).offset(40);
            make.right.equalTo(_bgView).offset(-40);
            make.height.mas_equalTo(totalHeight);
        }];
        
        ATSignAlertView *signAlertView = [[[NSBundle mainBundle] loadNibNamed:@"ATSignAlertView" owner:self options:nil] lastObject];
        [alertView addSubview:signAlertView];
        [signAlertView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(alertView);
            make.height.mas_equalTo(288);
        }];
        
        UIButton *closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeButton setImage:IMAGE(@"关闭") forState:UIControlStateNormal];
//        closeButton.backgroundColor = [UIColor redColor];
        closeButton.userInteractionEnabled = NO;
        [alertView addSubview:closeButton];
        [closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(alertView);
            make.top.equalTo(signAlertView.mas_bottom).offset(38);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        
        _alertView = alertView;
    }
    return self;
}

- (ATSignSuccessALertView * )init{
    ATSignSuccessALertView *alretView = [self initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    return alretView;
}

- (void)show{
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    _alertView.centerY = _bgView.centerY;
    CGRect rec = _alertView.frame;
    rec.origin.x = (Screen_Width - rec.size.width) / 2;
    _alertView.frame = rec;
}

- (void)alertTapClick{
    
}

- (void)sureBtnClick{
    [self removeFromSuperview];
}

- (void)dismissView{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rec = _alertView.frame;
        rec.origin.x = -(rec.size.width);
        _alertView.frame = rec;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}



@end
