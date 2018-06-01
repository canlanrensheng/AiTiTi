//
//  ATMineVIPThirdCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/14.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineVIPThirdCell.h"

@implementation ATMineVIPThirdCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    UILabel * label1 = [UILabel new];
    label1.text = @"套餐说明";
    label1.font = kFONT14;
    [self.contentView addSubview:label1];
    
    [label1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [label1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    UILabel * label2 = [UILabel new];
    label2.text = @"1、基础会员特权说明：\n免片头，公式查询，哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈好的滴滴答答滴滴答答滴滴答答滴滴答答";
    label2.font = kFONT14;
    label2.numberOfLines = 0;
    [self.contentView addSubview:label2];
    
    [label2 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [label2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [label2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label1 withOffset:20];
    
    UILabel * label3 = [UILabel new];
    label3.text = @"2、VIP特权说明：\n免片头，公式查询，哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈好的滴滴答答滴滴答答滴滴答答滴滴答答";
    label3.font = kFONT14;
    label3.numberOfLines = 0;
    [self.contentView addSubview:label3];
    
    [label3 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [label3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label2 withOffset:20];
    [label3 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [label3 autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
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
