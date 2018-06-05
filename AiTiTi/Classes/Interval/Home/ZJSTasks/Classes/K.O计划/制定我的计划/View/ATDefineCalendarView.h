//
//  ATDefineCalendarView.h
//  AiTiTi
//
//  Created by 张金山 on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseView.h"
#import <UIKit/UIKit.h>
#import "LPCalendarDate.h"
@interface ATDefineCalendarView : BaseView

@property (nonatomic, strong) NSDate *date;

//今天
@property (nonatomic,strong)  UIButton *dayButton;

@end
