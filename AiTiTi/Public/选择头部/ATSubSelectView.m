//
//  ATSubSelectView.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/16.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubSelectView.h"

@implementation ATSubSelectView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    UIButton * backButton = [UIButton buttonWithTitle:@"" titleColor:[UIColor whiteColor] font:kFONT13 target:self action:@selector(backAction) backImageName:@"return"];
    [self addSubview:backButton];
    
    [backButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [backButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.font = kFONT17;
    [self addSubview:self.titleLabel];
    
    [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:backButton withOffset:20];
    [self.titleLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:backButton];
    
    UIView * selectSubView = [UIView new];
    selectSubView.cornerRadius = 10;
    selectSubView.borderColor = [UIColor blackColor];
    selectSubView.borderWidth = 0.5;
    [self addSubview:selectSubView];
    
    [selectSubView autoSetDimensionsToSize:CGSizeMake(70, 20)];
    [selectSubView autoAlignAxis:ALAxisHorizontal toSameAxisOfView:backButton];
    [selectSubView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    UIImageView * selectImg = [UIImageView new];
    selectImg.image = IMAGE(@"select_img");
    [selectSubView addSubview:selectImg];
    
    [selectImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [selectImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.subjectLabel = [UILabel new];
    self.subjectLabel.text = @"类型";
    self.subjectLabel.font = kFONT14;
    [selectSubView addSubview:self.subjectLabel];
    
    [self.subjectLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.subjectLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:selectImg withOffset:-5];
    
    UIView * selectSubView2 = [UIView new];
    selectSubView2.cornerRadius = 10;
    selectSubView2.borderColor = [UIColor blackColor];
    selectSubView2.borderWidth = 0.5;
    [self addSubview:selectSubView2];
    
    [selectSubView2 autoSetDimensionsToSize:CGSizeMake(70, 20)];
    [selectSubView2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:backButton];
    [selectSubView2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:selectSubView withOffset:-20];
    
    UIImageView * selectImg2 = [UIImageView new];
    selectImg2.image = IMAGE(@"select_img");
    [selectSubView2 addSubview:selectImg2];
    
    [selectImg2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [selectImg2 autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.subjectLabel2 = [UILabel new];
    self.subjectLabel2.text = @"科目";
    self.subjectLabel2.font = kFONT14;
    [selectSubView2 addSubview:self.subjectLabel2];
    
    [self.subjectLabel2 autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.subjectLabel2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:selectImg2 withOffset:-5];
}

#pragma mark - Action
-(void)backAction{
    if (self.backBlock) {
        self.backBlock();
    }
}

@end
