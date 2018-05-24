//
//  ATRankMineView.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/2.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATRankMineView.h"

@implementation ATRankMineView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    self.headerImg = [UIImageView new];
    self.headerImg.image = IMAGE(@"Defult_header");
    [self addSubview:self.headerImg];
    
    [self.headerImg autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [self.headerImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    
    self.nickNameLabel = [UILabel new];
    self.nickNameLabel.text = @"我是学霸";
    [self.nickNameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [self addSubview:self.nickNameLabel];
    
    [self.nickNameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerImg withOffset:5];
    [self.nickNameLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.headerImg];
    
    self.lvImg = [UIImageView new];
    self.lvImg.image = IMAGE(@"rank_LV1");
    [self addSubview:self.lvImg];
    
    [self.lvImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.nickNameLabel withOffset:5];
    [self.lvImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.nickNameLabel];
    
    UILabel * label1 = [UILabel new];
    label1.text = @"学霸值：";
    label1.font = kFONT14;
    [self addSubview:label1];
    
    [label1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerImg withOffset:5];
    [label1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nickNameLabel withOffset:5];
    
    self.rankLabel = [UILabel new];
    self.rankLabel.text = @"4545";
    self.rankLabel.textColor = RGB(96, 183, 249);
    self.rankLabel.font = kFONT14;
    [self addSubview:self.rankLabel];
     
    [self.rankLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:label1 withOffset:5];
    [self.rankLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:label1];
    
    UILabel * label2 = [UILabel new];
    label2.text = @"梦想大学：";
    label2.textColor = RGB(146, 146, 146);
    label2.font = kFONT12;
    [self addSubview:label2];
    
    [label2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerImg withOffset:5];
    [label2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label1 withOffset:5];
    [label2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
    
    self.universityLabel = [UILabel new];
    self.universityLabel.text = @"桂林电子科技大学";
    self.universityLabel.textColor = RGB(146, 146, 146);
    self.universityLabel.font = kFONT12;
    [self addSubview:self.universityLabel];
    
    [self.universityLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:label2 withOffset:5];
    [self.universityLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:label2];
    
    self.NoLabel = [UILabel new];
    self.NoLabel.text = @"  排名：20  ";
    self.NoLabel.borderWidth = 0.5;
    self.NoLabel.borderColor = [UIColor grayColor];
    self.NoLabel.cornerRadius = 10;
    self.NoLabel.font = kFONT12;
    [self addSubview:self.NoLabel];
    
    [self.NoLabel autoSetDimension:ALDimensionHeight toSize:20];
    [self.NoLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.NoLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
}

@end
