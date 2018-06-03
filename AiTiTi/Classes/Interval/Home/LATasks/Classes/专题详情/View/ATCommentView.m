//
//  ATCommentView.m
//  AiTiTi
//
//  Created by LA on 2018/5/31.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATCommentView.h"

@interface ATCommentView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *writeBtn;
@property (nonatomic, strong) NSMutableArray *btnArray;

@end

@implementation ATCommentView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(28);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    CGFloat starWidth = 25;
    CGFloat btnPadding = 10;
    UIView *bottomView = [[UIView alloc] init];
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right);
        make.centerY.equalTo(self.titleLabel.mas_centerY);
        make.height.equalTo(self.mas_height);
        make.width.mas_equalTo(starWidth*5 + 4*btnPadding);
    }];
    
    NSMutableArray *tempArr = [NSMutableArray array];
    for(int i = 0 ; i < 5 ;i++){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * (starWidth + btnPadding), (38-25)/2, starWidth, starWidth);
        button.tag = i;
        [button setBackgroundImage:[UIImage imageNamed:@"star_default"] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:@"star_select"] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(tagButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [bottomView addSubview:button];
        [tempArr addObject:button];
    }
    [self.btnArray removeAllObjects];
    [self.btnArray addObjectsFromArray:tempArr];
    
    [self addSubview:self.writeBtn];
    [self.writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-28);
        make.width.mas_equalTo(50);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(self.mas_height);
    }];
    
//    //行
//    int row = 0;
//    //间距
//    CGFloat padding = 10;
//    CGFloat starWidth = 25;
//    for(int i = 0 ; i < 5 ;i++){
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        row = i % 5;// 取余 0 对5 0 row 01234
//        button.frame = CGRectMake(row * (starWidth + padding), 0, starWidth, starWidth);
//    }
    
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

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel creatLabel:^(UILabel *label) {
            label.ljTitle_font_textColor(@"课程评星：",[UIFont systemFontOfSize:14],[UIColor blackColor]);
            [label sizeToFit];
        }];
    }
    return _titleLabel;
}

- (UIButton *)writeBtn {
    if (!_writeBtn) {
        _writeBtn = [UIButton creatButton:^(UIButton *button) {
            button.ljTitle_font_titleColor_state(@"写评论",[UIFont systemFontOfSize:14],[UIColor blueColor],UIControlStateNormal);
            [button addTarget:self action:@selector(writeBtnAction) forControlEvents:UIControlEventTouchUpInside];
            [button sizeToFit];
        }];
    }
    return _writeBtn;
}

- (void)writeBtnAction {
    if (self.writeBtnBlock) {
        self.writeBtnBlock();
    }
}

- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}
@end
