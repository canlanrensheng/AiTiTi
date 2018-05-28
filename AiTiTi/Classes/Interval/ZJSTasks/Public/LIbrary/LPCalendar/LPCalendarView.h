//
//  LPCalendarView.h
//  Calendar
//
//  Created by yiqiang on 16/7/12.
//  Copyright © 2016年 yiqiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPCalendarDate.h"

typedef void(^cancleAlertViewBlock)(void);
typedef void(^calendarAlertViewBlock)(NSString *dateString);

@interface LPCalendarView : UIView

@property (nonatomic, strong) NSDate *date;

//今天
@property (nonatomic,strong)  UIButton *dayButton;

@property (nonatomic, copy) cancleAlertViewBlock cancleSheetBlock;

@property (nonatomic, copy) calendarAlertViewBlock calendarAlertViewBlock;

- (id)initWithFrame:(CGRect)frame cancleBlock:(cancleAlertViewBlock)cancleBlock calendarAlertViewBlock:(calendarAlertViewBlock)calendarAlertViewBlock;



@end
