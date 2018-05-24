//
//  ATMineVIPFourthCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/15.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineVIPFourthCell.h"

@implementation ATMineVIPFourthCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    UIView * questionView = [UIView new];
    [self.contentView addSubview:questionView];
    
    [questionView autoSetDimension:ALDimensionHeight toSize:50];
    [questionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 0, 0, 0) excludingEdge:ALEdgeTop];
    
    UIImageView * questionImg = [UIImageView new];
    questionImg.image = IMAGE(@"question");
    [questionView addSubview:questionImg];
    
    [questionImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [questionImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UILabel * questionlabel = [UILabel new];
    questionlabel.text = @"常见问题";
    questionlabel.font = kFONT14;
    [questionView addSubview:questionlabel];
    
    [questionlabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:questionImg withOffset:5];
    [questionlabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIImageView * forwordImg = [UIImageView new];
    forwordImg.image = IMAGE(@"forword");
    [questionView addSubview:forwordImg];
    
    [forwordImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [forwordImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIView * questionline = [UIView new];
    questionline.backgroundColor = ATGray;
    [questionView addSubview:questionline];
    
    [questionline autoSetDimension:ALDimensionHeight toSize:0.5];
    [questionline autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [questionline autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [questionline autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:questionImg withOffset:-10];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
