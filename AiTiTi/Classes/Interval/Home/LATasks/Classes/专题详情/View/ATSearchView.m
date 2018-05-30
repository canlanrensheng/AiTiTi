//
//  ATSearchView.m
//  AiTiTi
//
//  Created by LA on 2018/1/1.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSearchView.h"

@interface ATSearchView ()
@property (nonatomic, strong)UISearchBar *searchBar;
@end
@implementation ATSearchView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    UIView *searchBarBg = [UIView new];
    searchBarBg.backgroundColor = RGB(245, 245, 245);
    searchBarBg.cornerRadius = 20;
    [self addSubview:searchBarBg];
    [searchBarBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(28);
        make.right.mas_equalTo(-28);
        make.top.equalTo(self.mas_top);
        make.height.mas_equalTo(76/2);
    }];
    
    UIButton *publishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    publishBtn.frame = CGRectMake(Screen_Width - 128/4, 0, 128/2, 76/2);
    [publishBtn setTitle:@"发布" forState:0];
    UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:publishBtn.bounds byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight cornerRadii:CGSizeMake(38/2, 38/2)];
    CAShapeLayer *maskLayer=[[CAShapeLayer alloc]init];
    maskLayer.frame = publishBtn.bounds;
    maskLayer.path = maskPath.CGPath;
    publishBtn.layer.mask = maskLayer;
    publishBtn.layer.borderWidth = 1.0f;
    publishBtn.layer.borderColor = RGB(153, 153, 153).CGColor;
    [publishBtn addTarget:self action:@selector(publishAction) forControlEvents:UIControlEventTouchUpInside];
    [searchBarBg addSubview:publishBtn];
//    [publishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(searchBarBg.mas_right);
//        make.top.equalTo(searchBarBg.mas_top);
//        make.height.mas_equalTo(76/2);
//        make.width.mas_equalTo(128/2);
//    }];
    
    UISearchBar *searchBar = [UISearchBar new];
    searchBar.searchBarStyle = UISearchBarStyleMinimal;
    searchBar.placeholder = @"爱提提因为你的评论更精彩~";
    UITextField *searchField = [searchBar valueForKey:@"_searchField"];
    [searchField setValue:RGB(153, 153, 153) forKeyPath:@"_placeholderLabel.textColor"];
    searchField.borderStyle = UITextBorderStyleNone;
    searchField.font = [UIFont systemFontOfSize:12];
    [searchBarBg addSubview:searchBar];
    self.searchBar = searchBar;
    [searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(searchBarBg.mas_left);
        make.top.bottom.equalTo(searchBarBg);
        make.right.equalTo(publishBtn.mas_left);
    }];
    
}

#pragma mark - searchBarAction
- (void)publishAction {
    if (self.publishBlock) {
        self.publishBlock(self.searchBar.text);
    }
}

@end
