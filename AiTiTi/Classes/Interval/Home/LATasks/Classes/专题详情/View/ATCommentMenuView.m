//
//  ATCommentMenuView.m
//  AiTiTi
//
//  Created by LA on 2018/5/31.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATCommentMenuView.h"

#define ATCommentBgHeight 730/2
#define MYCOLOR(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
@interface ATCommentMenuView ()<UIGestureRecognizerDelegate,UITextViewDelegate>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIButton *starBtn;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIImageView *alertView;
@property (nonatomic, strong) NSMutableArray *btnArray;

@end

@implementation ATCommentMenuView

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
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideActionView)];
    tap.delegate = self;
    [self.bgView addGestureRecognizer:tap];
    self.bgView.backgroundColor = MYCOLOR(0, 0, 0, 0.4);
    [self addSubview:self.bgView];
    
    // 弹出视图
    UIImageView *alertView = [[UIImageView alloc] init];
    alertView.image = [UIImage imageNamed:@"commnet_bg"];
    alertView.contentMode = UIViewContentModeScaleToFill;
    alertView.userInteractionEnabled = YES;
    UITapGestureRecognizer * alertViewTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:nil];
    [alertView addGestureRecognizer:alertViewTap];
    [self.bgView addSubview:alertView];
    self.alertView = alertView;
    //从底部弹窗设置y:Screen_Height
    self.alertView.frame = CGRectMake(0, Screen_Height, Screen_Width, ATCommentBgHeight);
//    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.bgView.mas_bottom);
//        make.left.right.equalTo(self.bgView);
//        make.height.mas_equalTo(292);
//    }];
    
    // 标题
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"给老师的课程评个星吧~";
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    [alertView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(80);
        make.centerX.equalTo(alertView.mas_centerX);
    }];
    
    // 评论星星
    CGFloat starBtnW = 25;
    CGFloat starBtnSpace = ((Screen_Width -90) - starBtnW*5)/4;
    NSMutableArray *tempArr = [NSMutableArray array];
    for (int i = 0; i< 5; i++) {
        UIButton *starBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        starBtn.frame = CGRectMake(45 + i * (starBtnW + starBtnSpace), 80 + 40, starBtnW, starBtnW);
        starBtn.tag = i;
        [starBtn setBackgroundImage:[UIImage imageNamed:@"star_default"] forState:UIControlStateNormal];
        [starBtn setBackgroundImage:[UIImage imageNamed:@"star_select"] forState:UIControlStateSelected];
        [starBtn addTarget:self action:@selector(tagButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [alertView addSubview:starBtn];
        self.starBtn = starBtn;
        [tempArr addObject:starBtn];
    }
    [self.btnArray removeAllObjects];
    [self.btnArray addObjectsFromArray:tempArr];
    
    // 发表
    UIButton *commentBtn = [[UIButton alloc] init];
    [commentBtn setTitle:@"发表" forState:UIControlStateNormal];
    [commentBtn setBackgroundColor:RGB(54, 181, 252)];
    commentBtn.layer.cornerRadius = 35/2;
    commentBtn.layer.masksToBounds = YES;
    [commentBtn addTarget:self action:@selector(commentBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [alertView addSubview:commentBtn];
    [commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(35);
        make.right.mas_equalTo(-35);
        make.height.mas_equalTo(35);
        make.bottom.equalTo(alertView.mas_bottom).offset(-30);
    }];
    
    // textView
    UITextView *textView = [[UITextView alloc] init];
    textView.layer.borderColor = RGB(207, 208, 209).CGColor;
    textView.layer.borderWidth = 0.7;
    textView.layer.cornerRadius = 5.0f;
    textView.layer.masksToBounds = YES;
    textView.delegate = self;
    textView.returnKeyType = UIReturnKeySend;
    // UITextView内部判断send按钮是否可以用
    textView.enablesReturnKeyAutomatically = YES;
    //_placeholderLabel
    UILabel *placeHolderLabel = [[UILabel alloc] init];
    placeHolderLabel.text = @"爱提提因您的评论更精彩...";
    placeHolderLabel.numberOfLines = 0;
    placeHolderLabel.textColor = RGB(209, 210, 211);
    [placeHolderLabel sizeToFit];
    [textView addSubview:placeHolderLabel];
    // same font
    textView.font = [UIFont systemFontOfSize:13.f];
    placeHolderLabel.font = [UIFont systemFontOfSize:13.f];
    [textView setValue:placeHolderLabel forKey:@"_placeholderLabel"];
    
    [alertView addSubview:textView];
    self.textView = textView;
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
//      make.top.equalTo(self.starBtn.mas_bottom).mas_offset(20);
        make.height.mas_equalTo(100);
        make.bottom.equalTo(commentBtn.mas_top).offset(-30);;
    }];
    // 通过运行时，发现UITextView有一个叫做“_placeHolderLabel”的私有变量
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([textView class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *objcName = [NSString stringWithUTF8String:name];
        ATLog(@"%d : %@",i,objcName);
    }
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
        CGRect rec = self.alertView.frame;
        // 屏幕高度 - 视图高度 - 键盘高度
        rec.origin.y = [UIScreen mainScreen].bounds.size.height - rec.size.height - rect.size.height;
        self.alertView.frame = rec;
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
        CGRect rec = self.alertView.frame;
        rec.origin.y = Screen_Height - rec.size.height;
        self.alertView.frame = rec;
    }];
}

#pragma mark - TextView代理方法
- (void)textViewDidBeginEditing:(UITextView *)textView {
    [textView becomeFirstResponder];
}

// 点击发送按钮会调用
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
//    [UIView animateWithDuration:0.5 animations:^{
//        CGRect rec = self.alertView.frame;
//        rec.origin.y = Screen_Height - rec.size.height;
//        self.alertView.frame = rec;
//    }];
    // 这里只要注销就可以
    [textView resignFirstResponder];
}

- (void)tagButtonAction:(UIButton *)sender {
    for (int i = 0; i < self.btnArray.count; i++) {
        UIButton *tempBtn = (UIButton *)self.btnArray[i];
        if (i <= sender.tag) {
            // 将选中的按钮的之前按钮全部选中
            tempBtn.selected = YES;
        }else {
            // 将之后的按钮反选
            tempBtn.selected = NO;
        }
    }
}

- (void)commentBtnAction {
    if (self.commitBtnBlock) {
        self.commitBtnBlock(self.textView.text);
    }
    [self la_dismiss];
}

- (void)la_show {
    UIWindow *kWindow = [UIApplication sharedApplication].keyWindow;
    [kWindow addSubview:self];
    
    [UIView animateWithDuration:0.5 animations:^{
        // 在0.5秒内做的事情
        CGRect rec = self.alertView.frame;
        rec.origin.y = Screen_Height - ATCommentBgHeight;
        self.alertView.frame = rec;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)la_dismiss {
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rec = self.alertView.frame;
        rec.origin.y = Screen_Height;
        self.alertView.frame = rec;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)hideActionView {
    [self la_dismiss];
}

- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end

