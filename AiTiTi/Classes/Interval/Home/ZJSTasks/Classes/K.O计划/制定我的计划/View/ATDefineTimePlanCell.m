//
//  ATDefineTimePlanCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATDefineTimePlanCell.h"
#import "ATDefineCalendarView.h"
@implementation ATDefineTimePlanCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    ATDefineCalendarView *calendarView = [[ATDefineCalendarView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    calendarView.date=[NSDate date];
    [self.calendarView addSubview:calendarView];
    [calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.calendarView);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
