//
//  ATMineHelpCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/11.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineHelpCell.h"

@interface ATMineHelpCell()

@property(nonatomic,strong)UILabel * questionLabel;
@property(nonatomic,strong)UILabel * resultLabel;

@end

@implementation ATMineHelpCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    UILabel * label1 = [UILabel new];
    label1.text = @"问：";
    label1.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    [self.contentView addSubview:label1];
    
    [label1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [label1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    
    self.questionLabel = [UILabel new];
    self.questionLabel.text = @"如何使用爱提提才能最好的提高我的分数?";
    self.questionLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    self.questionLabel.numberOfLines = 0;
    [self.contentView addSubview:self.questionLabel];
    
    [self.questionLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [self.questionLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:label1];
    [self.questionLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    
    UILabel * label2 = [UILabel new];
    label2.text = @"答：";
    label2.font = [UIFont fontWithName:@"Helvetica-Bold" size:15];
    [self.contentView addSubview:label2];
    
    [label2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label1 withOffset:10];
    [label2 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    
    self.resultLabel = [UILabel new];
    self.resultLabel.text = @"学习，是指通过阅读、听讲、思考、研究、实践等途径获得知识或技能的过程。学习分为狭义与狭义:通过阅读、听讲、研究、观察、理解、探索、实验、实践等手段获得知识或技能的过程，是一种使个体可以得到持续变化(知识和技能，方法与过程，情感与价值的改善和升华)的行为方式。";
    self.resultLabel.font = kFONT13;
    self.resultLabel.numberOfLines = 0;
    [self.contentView addSubview:self.resultLabel];

    [self.resultLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label1 withOffset:10];
    [self.resultLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.questionLabel];
    [self.resultLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    [self.resultLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
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
