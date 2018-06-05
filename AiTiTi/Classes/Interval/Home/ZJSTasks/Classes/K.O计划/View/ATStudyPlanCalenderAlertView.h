//
//  ATStudyPlanCalenderAlertView.h
//  AiTiTi
//
//  Created by Oma-002 on 2018/6/1.
//  Copyright © 2018年 云辉. All rights reserved.
//


#import "BaseView.h"

typedef void(^calendarAlertViewBlock)(NSString *dateString);
typedef void(^cancleAlertViewBlock)(void);

@interface ATStudyPlanCalenderAlertView : UIView



@property (nonatomic, copy) calendarAlertViewBlock acitonSheetBlock;
@property (nonatomic, copy) cancleAlertViewBlock cancleSheetBlock;


- (instancetype)initWithFrame:(CGRect)frame
             actionSheetBlock:(calendarAlertViewBlock)actionSheetBlock
             cancleSheetBlock:(cancleAlertViewBlock)cancleSheetBlock;
- (void)show;
- (void)dismiss;
- (void)removeSubView;

- (void)showInView:(UIView *)view;


@end
