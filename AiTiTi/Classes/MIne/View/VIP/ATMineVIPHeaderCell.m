//
//  ATMineVIPHeaderCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/14.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineVIPHeaderCell.h"

@implementation ATMineVIPHeaderCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    UIImage * bannerImg = IMAGE(@"VIP_banner");
    UIImageView * banner = [UIImageView new];
    banner.image = bannerImg;
    banner.cornerRadius = 10;
    [self.contentView addSubview:banner];
    
    [banner autoSetDimensionsToSize:CGSizeMake(ATScreenWidth - 40, (ATScreenWidth - 40)*(bannerImg.size.height/bannerImg.size.width))];
    [banner autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [banner autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [banner autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:10];
    
    UIView * line = [UIView new];
//    line.backgroundColor = [UIColor redColor];
    [banner addSubview:line];
    
    [line autoSetDimensionsToSize:CGSizeMake(ATScreenWidth - 40, 1)];
    [line autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [line autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    [line autoAlignAxis:ALAxisHorizontal toSameAxisOfView:banner withOffset:-20];
    
    UILabel * label1 = [UILabel new];
    label1.text = @"我的VIP剩余天数";
    label1.font = kFONT14;
    label1.textColor = ATWhite;
    [banner addSubview:label1];
    
    [label1 autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:line withOffset:-10];
    [label1 autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    UIView * view1 = [UIView new];
    [banner addSubview:view1];
    
    [view1 autoSetDimensionsToSize:CGSizeMake((ATScreenWidth - 40)/3, 50)];
    [view1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [view1 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:line withOffset:10];
    
    self.memberLabel = [UILabel new];
    self.memberLabel.text = @"253";
    self.memberLabel.font = [UIFont systemFontOfSize:30];
    self.memberLabel.textColor = ATWhite;
    [view1 addSubview:self.memberLabel];
    
    [self.memberLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:view1 withOffset:-10];
    [self.memberLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    
    UILabel * label2 = [UILabel new];
    label2.text = @"天";
    label2.font = kFONT14;
    label2.textColor = ATWhite;
    [view1 addSubview:label2];
    
    [label2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.memberLabel withOffset:5];
    [label2 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.memberLabel withOffset:-5];
    
    UILabel * label3 = [UILabel new];
    label3.text = @"基础会员";
    label3.font = kFONT12;
    label3.textColor = ATWhite;
    [view1 addSubview:label3];
    
    [label3 autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [label3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.memberLabel];
    
    UIView * line1 = [UIView new];
    line1.backgroundColor = ATWhite;
    [view1 addSubview:line1];
    
    [line1 autoSetDimensionsToSize:CGSizeMake(0.5, 40)];
    [line1 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:view1];
    [line1 autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:view1 withOffset:5];
    //****************************************************************************************************************
    UIView * view2 = [UIView new];
    [banner addSubview:view2];
    
    [view2 autoSetDimensionsToSize:CGSizeMake((ATScreenWidth - 40)/3, 50)];
    [view2 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:view1];
    [view2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:line withOffset:10];
    
    self.allSubVIPLabel = [UILabel new];
    self.allSubVIPLabel.text = @"253";
    self.allSubVIPLabel.font = [UIFont systemFontOfSize:30];
    self.allSubVIPLabel.textColor = ATWhite;
    [view2 addSubview:self.allSubVIPLabel];
    
    [self.allSubVIPLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:view2 withOffset:-10];
    [self.allSubVIPLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    
    UILabel * label4 = [UILabel new];
    label4.text = @"天";
    label4.font = kFONT14;
    label4.textColor = ATWhite;
    [view2 addSubview:label4];
    
    [label4 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.allSubVIPLabel withOffset:5];
    [label4 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.allSubVIPLabel withOffset:-5];
    
    UILabel * label5 = [UILabel new];
    label5.text = @"全科VIP";
    label5.font = kFONT12;
    label5.textColor = ATWhite;
    [view2 addSubview:label5];
    
    [label5 autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [label5 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.allSubVIPLabel];
    
    UIView * line2 = [UIView new];
    line2.backgroundColor = ATWhite;
    [view2 addSubview:line2];
    
    [line2 autoSetDimensionsToSize:CGSizeMake(0.5, 40)];
    [line2 autoPinEdge:ALEdgeRight toEdge:ALEdgeRight ofView:view2];
    [line2 autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:view2 withOffset:5];
    //****************************************************************************************************************
    UIView * view3 = [UIView new];
    [banner addSubview:view3];
    
    [view3 autoSetDimensionsToSize:CGSizeMake((ATScreenWidth - 40)/3, 50)];
    [view3 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:view2];
    [view3 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:line withOffset:10];
    
    self.subjectVIPLabel = [UILabel new];
    self.subjectVIPLabel.text = @"253";
    self.subjectVIPLabel.font = [UIFont systemFontOfSize:30];
    self.subjectVIPLabel.textColor = ATWhite;
    [view3 addSubview:self.subjectVIPLabel];
    
    [self.subjectVIPLabel autoAlignAxis:ALAxisVertical toSameAxisOfView:view3 withOffset:-10];
    [self.subjectVIPLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    
    UILabel * label6 = [UILabel new];
    label6.text = @"天";
    label6.font = kFONT14;
    label6.textColor = ATWhite;
    [view3 addSubview:label6];
    
    [label6 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.subjectVIPLabel withOffset:5];
    [label6 autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:self.subjectVIPLabel withOffset:-5];
    
    UILabel * label7 = [UILabel new];
    label7.text = @"单科VIP";
    label7.font = kFONT12;
    label7.textColor = ATWhite;
    [view3 addSubview:label7];
    
    [label7 autoAlignAxis:ALAxisVertical toSameAxisOfView:view3 withOffset:-10];
    [label7 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.subjectVIPLabel];
    
    UIImageView * addImg = [UIImageView new];
    addImg.image = IMAGE(@"add");
    [view3 addSubview:addImg];
    
    [addImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:label7];
    [addImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:label7 withOffset:5];
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
