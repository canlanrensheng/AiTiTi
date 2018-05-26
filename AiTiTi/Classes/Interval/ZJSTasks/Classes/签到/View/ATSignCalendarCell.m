//
//  ATSignCalendarCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSignCalendarCell.h"
#import "ATSignSuccessALertView.h"
@implementation ATSignCalendarCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.signButton.clipsToBounds = YES;
    self.signButton.layer.cornerRadius = 37.0;
    self.backView.layer.cornerRadius = 5.0;
    self.backView.clipsToBounds = YES;
    self.backView.layer.borderColor = RGB(221, 221, 221).CGColor;
    self.backView.layer.borderWidth = 1.0;
}


- (IBAction)signButtonClick:(id)sender {
    ATSignSuccessALertView *signAlertView = [[ATSignSuccessALertView alloc] init];
    [signAlertView show];
}
@end
