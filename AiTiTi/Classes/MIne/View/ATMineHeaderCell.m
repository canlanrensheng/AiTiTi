//
//  ATMineHeaderCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/8.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineHeaderCell.h"

@implementation ATMineHeaderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    self.headerImg = [UIImageView new];
    self.headerImg.image = IMAGE(@"Defult_header");
    [self.contentView addSubview:self.headerImg];
    
    [self.headerImg autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 20, 20, 20) excludingEdge:ALEdgeRight];
    
    self.LVImg = [UIImageView new];
    self.LVImg.image = IMAGE(@"rank_LV1");
    [self.contentView addSubview:self.LVImg];
    
    [self.LVImg autoAlignAxis:ALAxisVertical toSameAxisOfView:self.headerImg];
    [self.LVImg autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.headerImg withOffset:5];
    
    self.nameLabel = [UILabel new];
    self.nameLabel.text = @"我是超级超级学霸";
    [self.nameLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:17]];
    [self.contentView addSubview:self.nameLabel];
    
    [self.nameLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerImg withOffset:10];
    [self.nameLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    self.gradeLabel = [UILabel new];
    self.gradeLabel.text = @"  高级学霸 >  ";
    self.gradeLabel.font = kFONT13;
    self.gradeLabel.textColor = RGB(248, 206, 83);
    self.gradeLabel.backgroundColor = RGB(254, 244, 209);
    self.gradeLabel.cornerRadius = 10;
    [self.contentView addSubview:self.gradeLabel];
    
    [self.gradeLabel autoSetDimension:ALDimensionHeight toSize:20];
    [self.gradeLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.nameLabel];
    [self.gradeLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    self.idLabel = [UILabel new];
    self.idLabel.text = @"提提号：233333";
    self.idLabel.font = kFONT13;
    self.idLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.idLabel];
    
    [self.idLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerImg withOffset:10];
    [self.idLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.nameLabel withOffset:5];
    
    self.rankLabel = [UILabel new];
    self.rankLabel.text = @"学霸值：233333";
    self.rankLabel.font = kFONT13;
    self.rankLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.rankLabel];
    
    [self.rankLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headerImg withOffset:10];
    [self.rankLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.idLabel withOffset:5];
    
    UIImageView * qrcodeImg = [UIImageView new];
    qrcodeImg.image = IMAGE(@"mine_QRCode");
    [self.contentView addSubview:qrcodeImg];
    
    [qrcodeImg autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [qrcodeImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
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
