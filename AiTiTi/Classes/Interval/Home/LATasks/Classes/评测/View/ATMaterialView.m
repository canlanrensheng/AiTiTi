
//
//  ATMaterialView.m
//  AiTiTi
//
//  Created by LA on 2018/6/8.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMaterialView.h"
#import "ATAnswerModel.h"
@interface ATMaterialView ()
// 题目
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *desLabel;
@property (nonatomic, strong) UIScrollView *readingMaterialScrollView;
@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ATMaterialView

- (void)tx_configSubViews {
    
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(22);
        make.height.mas_equalTo(29/2);
        make.top.equalTo(self);
    }];
    [self addSubview:self.desLabel];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(22/2);
        make.height.mas_equalTo(27/2);
    }];
    [self addSubview:self.readingMaterialScrollView];
    [self.readingMaterialScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.desLabel.mas_bottom).offset(40/2);
        make.left.equalTo(self.titleLabel.mas_left);
        make.right.mas_equalTo(-22);
        make.height.mas_equalTo(335/2);
    }];
    
    [self.readingMaterialScrollView addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.readingMaterialScrollView);
        make.top.equalTo(self.readingMaterialScrollView.mas_top);
        make.height.equalTo(self.readingMaterialScrollView.mas_height);
        //        make.bottom.equalTo(self.readingMaterialScrollView.mas_bottom).offset(10);
    }];
    self.readingMaterialScrollView.contentSize = CGSizeMake(Screen_Width, 300);
}

- (void)setModel:(ATAnswerModel *)model {
    _model = model;
    self.imageView.image = [UIImage imageNamed:model.imageUrl];
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel creatLabel:^(UILabel *label) {
            label.ljTitle_font_textColor(@"(一)论述类文本阅读（本题共3小题，9分）",H14,[UIColor blackColor]);
            label.ljAligment(TextAlignmentLeft);
            [label sizeToFit];
        }];
    }
    return _titleLabel;
}

- (UILabel *)desLabel {
    if (!_desLabel) {
        _desLabel = [UILabel creatLabel:^(UILabel *label) {
            label.ljTitle_font_textColor(@"阅读下面的文字，完成1-3题",H14,[UIColor blackColor]);
            label.ljAligment(TextAlignmentLeft);
            [label sizeToFit];
        }];
    }
    return _desLabel;
}

-(UIScrollView *)readingMaterialScrollView {
    if (!_readingMaterialScrollView) {
        _readingMaterialScrollView = [[UIScrollView alloc] init];
        _readingMaterialScrollView.showsVerticalScrollIndicator = NO;
    }
    return _readingMaterialScrollView;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}

@end

