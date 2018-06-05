//
//  TopButtomView.m
//  Zhuan
//
//  Created by txooo on 17/8/7.
//  Copyright © 2017年 张金山. All rights reserved.
//

#import "TopButtonView.h"
#import "UIView+Extension.h"
#define topButtonWidth [[UIScreen mainScreen] bounds].size.width/_titleArray.count

@interface TopButtonView ()

@property (nonatomic,strong) UIView *line;

@end

@implementation TopButtonView

- (instancetype)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)titleArray {
    if (self = [super initWithFrame:frame]) {
        _titleArray = titleArray;
        [self configSubviews];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.subviews enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([button isKindOfClass:[UIButton class]]) {
            [button setTitleColor:self.titleColor ? : [UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:self.selectTitleColor ? : self.titleColor ? : [UIColor whiteColor] forState:UIControlStateSelected];
            [button setBackgroundColor:[UIColor whiteColor]];
            button.titleLabel.font = self.font ? : H15;
        }
    }];
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    int i = 0;
    for (UIButton *button in self.subviews) {
        if (![button isKindOfClass:[UIButton class]]) {
            continue;
        }
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        i++;
    }
}

- (void)setShowBottomLine:(BOOL)showBottomLine {
    _showBottomLine = showBottomLine;
    if (showBottomLine) {
        [self addSubview:self.line];
    }
}

- (void)configSubviews {
    CGFloat height = self.frame.size.height;
    self.layer.borderColor = RGB(228, 228, 228).CGColor;
    self.layer.borderWidth = onePixel;
    [_titleArray enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(idx * topButtonWidth, 0, topButtonWidth, height);
        button.tag = 1000+idx;
        if (idx == self.selectIndex) {
            button.selected = YES;
        }
        [self addSubview:button];
    }];
}

- (void)setLoacadIndex:(NSInteger)loacadIndex{
    _loacadIndex = loacadIndex;
    UIButton *button = (UIButton *)[self viewWithTag:loacadIndex + 1000];
    NSInteger tag = button.tag - 1000;
    if (self.selectIndex == tag) {
        return;
    }
    self.selectIndex = tag;
    if (self.showBottomLine) {
        [UIView animateWithDuration:0.25 animations:^{
            self.line.x = tag * topButtonWidth;
        }];
    }
    for (UIButton *subButton in self.subviews) {
        if ([subButton isKindOfClass:[UIButton class]]) {
            subButton.selected = NO;
        }
    }
    button.selected = YES;
}

- (void)buttonClick:(UIButton *)button {
    NSInteger tag = button.tag - 1000;
    if (self.selectIndex == tag) {
        return;
    }
    self.selectIndex = tag;
    if (self.showBottomLine) {
        [UIView animateWithDuration:0.25 animations:^{
            self.line.x = tag * topButtonWidth;
        }];
    }
    for (UIButton *subButton in self.subviews) {
        if ([subButton isKindOfClass:[UIButton class]]) {
            subButton.selected = NO;
        }
    }
    button.selected = YES;
    [self.clickSubject sendNext:@(tag)];
}

- (RACSubject *)clickSubject {
    if (!_clickSubject) {
        _clickSubject = [RACSubject subject];
    }
    return _clickSubject;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-2, topButtonWidth, 2)];
        _line.backgroundColor = self.tintColor ? : self.selectTitleColor;
    }
    return _line;
}

@end
