//
//  ATMineVIPCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/14.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineVIPCell.h"

@interface ATMineVIPCell()

@property (nonatomic,copy) NSString * moonString;

@end

@implementation ATMineVIPCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    self.moneyButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.moneyButton setBackgroundImage:IMAGE(@"select_off") forState:UIControlStateNormal];
    [self.moneyButton setBackgroundImage:IMAGE(@"select_on") forState:UIControlStateSelected];
    [self.moneyButton addTarget:self action:@selector(moneyButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.moneyButton];
    
    [self.moneyButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [self.moneyButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    
    self.momberLabel = [UILabel new];
    self.momberLabel.font = kFONT17;
    [self.contentView addSubview:self.momberLabel];
    
    [self.momberLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.moneyButton withOffset:10];
    [self.momberLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.moneyButton];
    
    self.discountLabel = [UILabel new];
    self.discountLabel.font = kFONT13;
    self.discountLabel.textColor = ATGray;
    [self.contentView addSubview:self.discountLabel];
    
    [self.discountLabel autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [self.discountLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.moneyButton];
    
    self.moneyLabel = [UILabel new];
    self.moneyLabel.font = kFONT17;
    self.moneyLabel.textColor = [UIColor redColor];
    [self.contentView addSubview:self.moneyLabel];
    
    [self.moneyLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:self.discountLabel];
    [self.moneyLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:self.moneyButton];
    
    UILabel * moonLabel = [UILabel new];
    moonLabel.text = @"1个月";
    moonLabel.font = kFONT12;
    moonLabel.borderColor = ATGray;
    moonLabel.borderWidth = 1;
    moonLabel.cornerRadius = 12.5;
    moonLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:moonLabel];
    
    UIImageView * increaseImg = [UIImageView new];
    increaseImg.image = IMAGE(@"increase");
    [increaseImg addJXTouch:^{
        NSArray * array = [moonLabel.text componentsSeparatedByString:@"个"];
        NSInteger moon = [array[0] integerValue];
        moonLabel.text = [NSString stringWithFormat:@"%ld个月",moon + 1];
        self.moonString = moonLabel.text;
        if (self.moonSelect) {
            self.moonSelect(moonLabel.text);
        }
    }];
    [self.contentView addSubview:increaseImg];
    
    [increaseImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [increaseImg autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    
    [moonLabel autoSetDimensionsToSize:CGSizeMake(60, 25)];
    [moonLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:increaseImg withOffset:-5];
    [moonLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:increaseImg];
    
    UIImageView * minusImg = [UIImageView new];
    minusImg.image = IMAGE(@"minus");
    [minusImg addJXTouch:^{
        NSArray * array = [moonLabel.text componentsSeparatedByString:@"个"];
        NSInteger moon = [array[0] integerValue];
        if (moon == 1) {
            return;
        }
        moonLabel.text = [NSString stringWithFormat:@"%ld个月",moon - 1];
        self.moonString = moonLabel.text;
        if (self.moonSelect) {
            self.moonSelect(moonLabel.text);
        }
    }];
    [self.contentView addSubview:minusImg];
    
    [minusImg autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:moonLabel withOffset:-5];
    [minusImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:increaseImg];
}

-(void)moneyButtonAction{
    if (self.menberSelect) {
        self.menberSelect(self.moonString);
    }
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
