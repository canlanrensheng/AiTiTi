//
//  ATRankListCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATRankListCell.h"

@interface ATRankListCell()

@property(nonatomic,strong)UIImageView * headerImg;
@property(nonatomic,strong)UILabel * nickNameLabel;
@property(nonatomic,strong)UIImageView * lvImg;
@property(nonatomic,strong)UILabel * rankLabel;
@property(nonatomic,strong)UILabel * universityLabel;

@end

@implementation ATRankListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    
    self.NoLabel = [UILabel new];
    self.NoLabel.font = kFONT15;
    [self.contentView addSubview:self.NoLabel];
    
    [self.NoLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:25];
    [self.NoLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.NoImg = [UIImageView new];
    [self.contentView addSubview:self.NoImg];
    
    [self.NoImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [self.NoImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.headerImg = [UIImageView new];
    self.headerImg.image = IMAGE(@"Defult_header");
    [self.contentView addSubview:self.headerImg];
    
    [self.headerImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.headerImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:50];
    
    self.nickNameLabel = [UILabel new];
    self.nickNameLabel.text = @"我是学霸";
    [self.nickNameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
    [self.contentView addSubview:self.nickNameLabel];
    
    [self.nickNameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerImg withOffset:5];
    [self.nickNameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    self.lvImg = [UIImageView new];
    self.lvImg.image = IMAGE(@"rank_LV1");
    [self.contentView addSubview:self.lvImg];
    
    [self.lvImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.nickNameLabel withOffset:5];
    [self.lvImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.nickNameLabel];
    
    UILabel * label1 = [UILabel new];
    label1.text = @"学霸值：";
    label1.font = kFONT14;
    [self.contentView addSubview:label1];
    
    [label1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerImg withOffset:5];
    [label1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nickNameLabel withOffset:5];
    
    self.rankLabel = [UILabel new];
    self.rankLabel.text = @"4545";
    self.rankLabel.textColor = RGB(96, 183, 249);
    self.rankLabel.font = kFONT14;
    [self.contentView addSubview:self.rankLabel];
    
    [self.rankLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:label1 withOffset:5];
    [self.rankLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:label1];
    
    UILabel * label2 = [UILabel new];
    label2.text = @"梦想大学：";
    label2.textColor = RGB(146, 146, 146);
    label2.font = kFONT12;
    [self.contentView addSubview:label2];
    
    [label2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerImg withOffset:5];
    [label2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label1 withOffset:5];
    [label2 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
    
    self.universityLabel = [UILabel new];
    self.universityLabel.text = @"桂林电子科技大学";
    self.universityLabel.textColor = RGB(146, 146, 146);
    self.universityLabel.font = kFONT12;
    [self.contentView addSubview:self.universityLabel];
    
    [self.universityLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:label2 withOffset:5];
    [self.universityLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:label2];
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
