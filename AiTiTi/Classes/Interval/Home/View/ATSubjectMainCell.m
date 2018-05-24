//
//  ATSubjectMainCell.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/15.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubjectMainCell.h"

@interface ATSubjectMainCell ()
@property (weak, nonatomic) IBOutlet UIView *shadowView;

@end

@implementation ATSubjectMainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
        
    self.shadowView.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.shadowView.layer.shadowOffset = CGSizeMake(1, 1);
    self.shadowView.layer.shadowOpacity = 0.3;
    self.shadowView.layer.shadowRadius = 4;
    self.shadowView.layer.cornerRadius = 6.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
