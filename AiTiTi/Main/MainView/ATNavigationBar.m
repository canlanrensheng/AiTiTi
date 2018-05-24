//
//  ATNavigationBar.m
//  AiTiTi
//
//  Created by 童城 on 2018/4/23.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATNavigationBar.h"

@interface ATNavigationBar ()
/**
 *  左侧button
 */
@property (nonatomic,strong)  UIButton *leftBtn;
/**
 *  右侧button
 */
@property (nonatomic,strong)  UIButton *rightBtn;
/**
 *  中间title
 */
@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation ATNavigationBar

- (id)initWithFrame:(CGRect)frame title:(NSString *)title leftName:(NSString *)leftName rightName:(NSString *)rightName
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = ATWhite;

        if (title.length) {
            _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(ATScreenWidth/2 - 100, 20, 200, self.height - 20)];
            _titleLabel.textColor = [UIColor blackColor];
            _titleLabel.text = title;
            _titleLabel.font = [UIFont systemFontOfSize:18.0];
            _titleLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:_titleLabel];
        }
        
        // 左边btn
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftBtn setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
        _leftBtn.adjustsImageWhenHighlighted = NO;
        [self addSubview:_leftBtn];
        _leftBtn.frame = CGRectMake(15, 20, 25, self.height - 20);
        
        // 右边btn
        if(rightName.length){
            _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            [_rightBtn setTitle:rightName forState:UIControlStateNormal];
            _rightBtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
            CGSize rightBtnSize = [rightName sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0f]}];
            CGFloat btnW = MAX(rightBtnSize.width+10, 34);
            _rightBtn.frame = CGRectMake(ATScreenWidth - btnW - 15, 20, btnW , self.height - 20);
            [_rightBtn addTarget:self action:@selector(nextAction) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:_rightBtn];
            _rightBtn.adjustsImageWhenHighlighted = NO;
        }
        CGFloat maxW = ATScreenWidth - (_rightBtn.width+15)*2;
        _titleLabel.frame = CGRectMake((ATScreenWidth-maxW)/2, 20, maxW, self.height-20);
    }
    return self;
}

- (id)initWithTitle:(NSString *)title leftName:(NSString *)leftName rightName:(NSString *)rightName delegate:(id<ATNavigationBarDelegate>)delegate
{
    UIViewController *controller = (UIViewController *)delegate;
    ATNavigationBar *bar = [self initWithFrame:CGRectMake(0, 0, ATScreenWidth, navigationH) title:title leftName:leftName rightName:rightName];
    [controller.view addSubview:bar];
    bar.delegate = delegate;
    
    if (iPhoneX) {
        bar.height += 24;
        for (UIView *subV in bar.subviews) {
            subV.y += 24;
        }
    }
    return bar;
}

- (void)setLeftBtnHiden:(BOOL)leftBtnHiden
{
    _leftBtnHiden = leftBtnHiden;
    _leftBtn.hidden = leftBtnHiden;// defaults
}

-(void)setRightBtnHiden:(BOOL)rightBtnHiden{
    _rightBtnHiden=rightBtnHiden;
    _rightBtn.hidden = rightBtnHiden;// defaults
}

- (void)backAction
{
    if ([self.delegate respondsToSelector:@selector(backItemClick)]) {
        [self.delegate backItemClick];
    }else{
        
        if ([self.delegate isKindOfClass:[UIViewController class]]) {
            
            UIViewController *controller = (UIViewController *)self.delegate;
            [controller.view endEditing:YES];
            [controller.navigationController popViewControllerAnimated:YES];
        }
    }
}

- (void)nextAction
{
    if ([self.delegate respondsToSelector:@selector(nextItemClick)]) {
        [self.delegate nextItemClick];
    }
}

@end
