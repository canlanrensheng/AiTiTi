//
//  ATTextFieldBottomView.m
//  AiTiTi
//
//  Created by LA on 2018/6/4.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTextFieldBottomView.h"
#import "ATTextFieldBottomTool.h"

#define ATTextFieldHeight 49
#define MYCOLOR(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@interface ATTextFieldBottomView ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) ATTextFieldBottomTool *bottomTool;
@end

@implementation ATTextFieldBottomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    // shadowView
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    self.bgView.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] init];
    @weakify(self);
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        @strongify(self);
        [self la_dismiss];
    }];
    tap.delegate = self;
    [self.bgView addGestureRecognizer:tap];
    self.bgView.backgroundColor = MYCOLOR(0, 0, 0, 0.4);
    [self addSubview:self.bgView];
    
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_Height - ATTextFieldHeight, Screen_Width, ATTextFieldHeight)];
    self.bottomTool = [[[NSBundle mainBundle] loadNibNamed:@"ATTextFieldBottomTool" owner:self options:nil] lastObject];
    self.bottomTool.frame = CGRectMake(0, Screen_Height - ATTextFieldHeight, Screen_Width, ATTextFieldHeight);
    [tempView addSubview:self.bottomTool];
    [self.bgView addSubview:tempView];
    
    // keyboard
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

#pragma mark - 键盘出现
- (void)keyboardWillShow:(NSNotification *)noti {
    NSDictionary * dic = noti.userInfo;
    NSTimeInterval time = [[dic objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    NSValue * value = [dic objectForKey: UIKeyboardFrameEndUserInfoKey];
    // 键盘的高度
    CGRect rect;
    [value getValue:&rect];
    [UIView animateWithDuration:time animations:^{
        CGRect rec = self.bottomTool.frame;
        // 屏幕高度 - 视图高度 - 键盘高度
        rec.origin.y = [UIScreen mainScreen].bounds.size.height - rec.size.height - rect.size.height;
        self.bottomTool.frame = rec;
    }];
}

#pragma mark 键盘消失
-(void)keyboardWillHide:(NSNotification *)noty {
    NSDictionary * dic = noty.userInfo;
    NSTimeInterval time = [[dic objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    NSValue * value = [dic objectForKey: UIKeyboardFrameEndUserInfoKey];
    CGRect rect;
    [value getValue:&rect];
    [UIView animateWithDuration:time animations:^{
        // 键盘消失 归位
        CGRect rec = self.bottomTool.frame;
        rec.origin.y = Screen_Height - rec.size.height;
        self.bottomTool.frame = rec;
    }];
}

- (void)la_show {
    UIWindow *kWindow = [UIApplication sharedApplication].keyWindow;
    [kWindow addSubview:self];
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rec = self.bottomTool.frame;
        rec.origin.y = Screen_Height - ATTextFieldHeight;
        self.bottomTool.frame = rec;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)la_dismiss {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rec = self.bottomTool.frame;
        rec.origin.y = Screen_Height;
        self.bottomTool.frame = rec;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
