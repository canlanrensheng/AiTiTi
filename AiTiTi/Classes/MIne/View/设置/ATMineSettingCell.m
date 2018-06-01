//
//  ATMineSettingCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/11.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineSettingCell.h"

@implementation ATMineSettingCell

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
    
    [self.headerImg autoSetDimensionsToSize:CGSizeMake(60, 60)];
    [self.headerImg autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeLeft];
    
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
