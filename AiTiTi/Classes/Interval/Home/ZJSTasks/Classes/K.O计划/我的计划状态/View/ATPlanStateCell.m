//
//  ATPlanStateCell.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/6/1.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATPlanStateCell.h"

@implementation ATPlanStateCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self.backV clipWithCornerRadius:5 borderColor:[UIColor colorWithRed:221.0f/255.0f green:221.0f/255.0f blue:221.0f/255.0f alpha:1.0f] borderWidth:0.5];
    [self.startStudyButton clipWithCornerRadius:16.0 borderColor:nil borderWidth:0];

    self.classNameLabel.clipsToBounds = YES;
    self.classNameLabel.layer.cornerRadius = 3.0f;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)startStudyButtonClick:(id)sender {
}
@end
