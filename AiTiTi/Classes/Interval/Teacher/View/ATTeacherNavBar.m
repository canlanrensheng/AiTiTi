//
//  ATTeacherNavBar.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/8.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTeacherNavBar.h"

@interface ATTeacherNavBar ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topMargin;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;

@end

@implementation ATTeacherNavBar

- (void)awakeFromNib {
    [super awakeFromNib];
    if (iPhoneX) {
        self.height += 24;
        self.topMargin.constant += 24;
    }
    self.rightBtn.layer.borderColor = RGB(51, 51, 51).CGColor;
    self.rightBtn.layer.borderWidth = 1;
    self.rightBtn.layer.cornerRadius = 14;
    self.rightBtn.layer.masksToBounds = YES;
}


+ (ATTeacherNavBar *)teacherNavBar {
    ATTeacherNavBar *teacherNavBar = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(ATTeacherNavBar.class) owner:nil options:nil] firstObject];
    return teacherNavBar;
}


@end
