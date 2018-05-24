//
//  ATMineCourceCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/10.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineCourceCell.h"

@interface ATMineCourceCell()

@property(nonatomic,strong)UILabel * categoryLabel;
@property(nonatomic,strong)UILabel * subjectLabel;
@property(nonatomic,strong)UILabel * titleLabel;
@property(nonatomic,strong)UILabel * dayLabel;
@property(nonatomic,strong)UILabel * studyLabel;

@end

@implementation ATMineCourceCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
//    self.categoryLabel = [UILabel new];
//    self.categoryLabel.text = @" 专题 ";
//    self.categoryLabel.font = kFONT10;
//    self.categoryLabel.textColor = ATWhite;
//    self.categoryLabel.cornerRadius = 5;
//    self.categoryLabel.backgroundColor = ATBlue;
//    [self.contentView addSubview:self.categoryLabel];
//
//    [self.categoryLabel autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
//    [self.categoryLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
//
//    self.subjectLabel = [UILabel new];
//    self.subjectLabel.text = @" 数学 ";
//    self.subjectLabel.font = kFONT10;
//    self.subjectLabel.textColor = ATWhite;
//    self.subjectLabel.cornerRadius = 5;
//    self.subjectLabel.backgroundColor = [UIColor grayColor];
//    [self.contentView addSubview:self.subjectLabel];
//
//    [self.subjectLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.categoryLabel withOffset:5];
//    [self.subjectLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.font = kFONT15;
    self.titleLabel.numberOfLines = 0;
    [self.contentView addSubview:self.titleLabel];
    
    [self.titleLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 10, 10, 10) excludingEdge:ALEdgeBottom];
    
    UIImage * cateImg = IMAGE(@"cource_cate");
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:@" 福建省分开就分开发减肥就减肥饭后福建省科技分发生的复合肥"];
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = cateImg;
    attch.bounds = CGRectMake(0, -3, 15 * cateImg.size.width/cateImg.size.height, 15);
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    [attri insertAttributedString:string atIndex:0];
    
    NSTextAttachment *attch1 = [[NSTextAttachment alloc] init];
    attch1.image = cateImg;
    attch1.bounds = CGRectMake(0, -3, 15 * cateImg.size.width/cateImg.size.height, 15);
    NSAttributedString *string1 = [NSAttributedString attributedStringWithAttachment:attch1];
    [attri insertAttributedString:string1 atIndex:2];
    
    self.titleLabel.attributedText = attri;
    
    UIView * leftView = [UIView new];
    [self.contentView addSubview:leftView];
    
    [leftView autoSetDimensionsToSize:CGSizeMake(self.contentView.width/2, 40)];
    [leftView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel];
    [leftView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [leftView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    
    UIImageView * timeImg = [UIImageView new];
    timeImg.image = IMAGE(@"time");
    [leftView addSubview:timeImg];
    
    [timeImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [timeImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.dayLabel = [UILabel new];
    self.dayLabel.text = @"剩余天数：60天";
    self.dayLabel.font = kFONT12;
    self.dayLabel.textColor = ATGray;
    [leftView addSubview:self.dayLabel];
    
    [self.dayLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:timeImg withOffset:5];
    [self.dayLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIView * rightView = [UIView new];
    [self.contentView addSubview:rightView];
    
    [rightView autoSetDimensionsToSize:CGSizeMake(self.contentView.width/2, 40)];
    [rightView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.titleLabel];
    [rightView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [rightView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    
    UIImageView * playImg = [UIImageView new];
    playImg.image = IMAGE(@"play");
    [rightView addSubview:playImg];
    
    [playImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [playImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.studyLabel = [UILabel new];
    self.studyLabel.text = @"已学：40%";
    self.studyLabel.font = kFONT12;
    self.studyLabel.textColor = ATGray;
    [rightView addSubview:self.studyLabel];
    
    [self.studyLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:playImg withOffset:5];
    [self.studyLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
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
