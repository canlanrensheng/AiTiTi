//
//  ATSubjectListCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/8.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubjectListCell.h"

@interface ATSubjectListCell()

@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * playLabel;
@property(nonatomic,strong)UILabel * goodLabel;
@property(nonatomic,strong)UILabel * commentLabel;

@end

@implementation ATSubjectListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    self.numLabel = [UILabel new];
    self.numLabel.font = kFONT17;
    [self.contentView addSubview:self.numLabel];
    
    [self.numLabel autoSetDimension:ALDimensionWidth toSize:40];
    [self.numLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [self.numLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.text = @"的辅导费你看发的反馈烦恼放哪款反馈发枯发贺卡发哈看回款反馈发枯发贺卡发哈看回放";
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = kFONT14;
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.numLabel withOffset:10];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [self.titleLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    
    UIView * view = [UIView new];
    [self.contentView addSubview:view];
    
    [view autoSetDimension:ALDimensionHeight toSize:30];
    [view autoSetDimension:ALDimensionWidth toSize:30 relation:NSLayoutRelationGreaterThanOrEqual];
    [view autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.numLabel withOffset:10];
    [view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel withOffset:10];
    [view autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
    [view autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];

    UIImageView * playImg = [UIImageView new];
    playImg.image = IMAGE(@"play");
    [view addSubview:playImg];

    [playImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:5];
    [playImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];

    self.playLabel = [UILabel new];
    self.playLabel.text = @"123次";
    self.playLabel.font = kFONT12;
    self.playLabel.textColor = [UIColor grayColor];
    [view addSubview:self.playLabel];

    [self.playLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:playImg withOffset:5];
    [self.playLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];

    UIImageView * goodImg = [UIImageView new];
    goodImg.image = IMAGE(@"good");
    [view addSubview:goodImg];

    [goodImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.playLabel withOffset:20];
    [goodImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];

    self.goodLabel = [UILabel new];
    self.goodLabel.text = @"654次";
    self.goodLabel.font = kFONT12;
    self.goodLabel.textColor = [UIColor grayColor];
    [view addSubview:self.goodLabel];

    [self.goodLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:goodImg withOffset:5];
    [self.goodLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];

    UIImageView * commentImg = [UIImageView new];
    commentImg.image = IMAGE(@"comment");
    [view addSubview:commentImg];

    [commentImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.goodLabel withOffset:20];
    [commentImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];

    self.commentLabel = [UILabel new];
    self.commentLabel.text = @"367条";
    self.commentLabel.font = kFONT12;
    self.commentLabel.textColor = [UIColor grayColor];
    [view addSubview:self.commentLabel];

    [self.commentLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:commentImg withOffset:5];
    [self.commentLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
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
