//
//  ATRechargeListCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/13.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATRechargeListCell.h"

@interface ATRechargeListCell()

@property(nonatomic,strong)UILabel * messagesLabel;
@property(nonatomic,strong)UILabel * dateLabel;
@property(nonatomic,strong)UILabel * moneyLabel;

@end

@implementation ATRechargeListCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    self.messagesLabel = [UILabel new];
    self.messagesLabel.text = @"充值100元";
    self.messagesLabel.font = kFONT16;
    [self.contentView addSubview:self.messagesLabel];
    
    [self.messagesLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [self.messagesLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    self.dateLabel = [UILabel new];
    self.dateLabel.text = @"2018.07.07";
    self.dateLabel.font = kFONT12;
    self.dateLabel.textColor = ATGray;
    [self.contentView addSubview:self.dateLabel];
    
    [self.dateLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [self.dateLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.messagesLabel withOffset:10];
    [self.dateLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:20];
    
    self.moneyLabel = [UILabel new];
    self.moneyLabel.text = @"¥100";
    self.moneyLabel.textColor = [UIColor redColor];
    self.moneyLabel.font = [UIFont systemFontOfSize:18];
    [self.contentView addSubview:self.moneyLabel];
    
    [self.moneyLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.moneyLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
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
