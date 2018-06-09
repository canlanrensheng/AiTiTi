//
//  ATStudyPlanCalendarView.h
//  AiTiTi
//
//  Created by Oma-002 on 2018/6/1.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseView.h"

#import <UIKit/UIKit.h>
#import "LPCalendarDate.h"

typedef void(^cancleAlertViewBlock)(void);
typedef void(^calendarAlertViewBlock)(NSString *dateString);

@interface ATStudyPlanCalendarView : UIView

@property (nonatomic, strong) NSDate *date;

//今天
@property (nonatomic,strong)  UIButton *dayButton;

@property (nonatomic, copy) cancleAlertViewBlock cancleSheetBlock;

@property (nonatomic, copy) calendarAlertViewBlock calendarAlertViewBlock;

- (id)initWithFrame:(CGRect)frame cancleBlock:(cancleAlertViewBlock)cancleBlock calendarAlertViewBlock:(calendarAlertViewBlock)calendarAlertViewBlock;



@end
