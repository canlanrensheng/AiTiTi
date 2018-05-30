//
//  ATSignCalendarCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSignCalendarCell.h"
#import "ATSignSuccessALertView.h"

#import "LPCalendarView.h"
@interface ATSignCalendarCell()

@property (nonatomic,strong) LPCalendarView *calendarView;

@end
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
    
    [self.calendarBackView addSubview:self.calendarView];
    [self.calendarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self.calendarBackView);
    }];
}


- (IBAction)signButtonClick:(id)sender {
    ATSignSuccessALertView *signAlertView = [[ATSignSuccessALertView alloc] init];
    [signAlertView show];
}

- (LPCalendarView *)calendarView{
    if(!_calendarView){
//        CGFloat itemH  = (self.frame.size.width - 30) / 7;
       CGFloat itemH = (30 + 10) * 6 + 80;
        _calendarView = [[LPCalendarView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 30, itemH) cancleBlock:^{
           
        } calendarAlertViewBlock:^(NSString *dateString) {
            
        }];
        _calendarView.date=[NSDate date];
//        _calendarView.backgroundColor = [UIColor redColor];
    }
    return _calendarView;
}


@end
