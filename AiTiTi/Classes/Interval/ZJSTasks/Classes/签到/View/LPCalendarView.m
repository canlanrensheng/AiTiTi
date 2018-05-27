//
//  LPCalendarView.m
//  Calendar
//
//  Created by yiqiang on 16/7/12.
//  Copyright © 2016年 yiqiang. All rights reserved.
//

#import "LPCalendarView.h"

@implementation LPCalendarView
{
    UIButton  *_selectButton;
    NSMutableArray *_daysArray;
    
    UILabel *headlabel;
    
    UIButton *rightButton;
    UIImageView *rightImg;
    
    UIButton *lastSelectButton;
    
    NSDate *lpDate;
}

- (id)initWithFrame:(CGRect)frame cancleBlock:(cancleAlertViewBlock)cancleBlock calendarAlertViewBlock:(calendarAlertViewBlock)calendarAlertViewBlock
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = red_color;
        _daysArray = [NSMutableArray arrayWithCapacity:42];
        for (int i = 0; i < 42; i++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [self addSubview:button];
            [_daysArray addObject:button];
            if(cancleBlock){
                self.cancleSheetBlock = cancleBlock;
            }
            if(calendarAlertViewBlock){
                self.calendarAlertViewBlock = calendarAlertViewBlock;
            }
        }
    }
    return self;
}

#pragma mark - create View
- (void)setDate:(NSDate *)date{
    _date = date;
    [self createCalendarViewWith:date];
}

- (void)createCalendarViewWith:(NSDate *)date{
    
    lpDate=self.date;
    
//    CGFloat itemW  = self.frame.size.width / 7;
//    CGFloat itemH  = self.frame.size.width / 7;
    
    // 1.year month
    headlabel = [[UILabel alloc] init];
    headlabel.text = [NSString stringWithFormat:@"%li年%@月",[LPCalendarDate year:date],[self transformInter:[LPCalendarDate month:date]]];
    headlabel.font     = [UIFont systemFontOfSize:16];
    headlabel.frame           = CGRectMake( self.frame.size.width/2-35, 0, 90, 20);
    headlabel.centerX = self.centerX;
    headlabel.textAlignment   = NSTextAlignmentCenter;
    [self addSubview:headlabel];
    
    
    //last month
    UIButton *leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.frame=CGRectMake(30, 0, 21, 36);
    [leftButton addTarget:self action:@selector(clickMonth:) forControlEvents:UIControlEventTouchUpInside];
    leftButton.centerY = headlabel.centerY;
    [leftButton setImage:[UIImage imageNamed:@"return"] forState:UIControlStateNormal];
    [self addSubview:leftButton];
    

    rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame=CGRectMake(self.bounds.size.width - 30 - leftButton.frame.size.width, leftButton.frame.origin.y, leftButton.frame.size.width, leftButton.frame.size.height);
    rightButton.centerY = headlabel.centerY;
    [rightButton setImage:[UIImage imageNamed:@"arrow_right"] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(clickMonth:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightButton];
    
    
    
//    //取消按钮
//    UIButton * cancleButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    cancleButton.frame=CGRectMake(Screen_Width - 16 - 40, leftButton.frame.origin.y, 40, 20);
//    cancleButton.centerY = headlabel.centerY;
//    [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
//    [cancleButton setTitleColor:lightGray_color forState:UIControlStateNormal];
//    cancleButton.titleLabel.font = H14;
//    [cancleButton addTarget:self action:@selector(cancleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:cancleButton];
    
    CGFloat calendarBtnHeight = 30;
    CGFloat padding = (self.frame.size.width - 32 - 7 * calendarBtnHeight) /6;
    // 2.weekday
    NSArray *array = @[@"日", @"一", @"二", @"三", @"四", @"五", @"六"];
    UIView *weekBg = [[UIView alloc] init];
    weekBg.frame = CGRectMake(16, CGRectGetMaxY(headlabel.frame) + 30, self.frame.size.width - 32, 20);
    CGFloat weekBtnWidth = (self.frame.size.width - 32) / 7;
    [self addSubview:weekBg];
    
    
    
    for (int i = 0; i < 7; i++) {
        UILabel *week = [[UILabel alloc] init];
        week.text     = array[i];
        week.font     = [UIFont systemFontOfSize:14];
        week.frame    = CGRectMake((calendarBtnHeight + padding) * i, 0, calendarBtnHeight, 20);
        week.textAlignment   = NSTextAlignmentCenter;
        week.textAlignment = NSTextAlignmentCenter;
        week.backgroundColor = [UIColor whiteColor];
        week.textColor       = [UIColor orangeColor];
        [weekBg addSubview:week];
    }
    
    NSInteger daysInLastMonth = [LPCalendarDate totaldaysInMonth:[LPCalendarDate lastMonth:date]];
    NSInteger daysInThisMonth = [LPCalendarDate totaldaysInMonth:date];
    NSInteger firstWeekday    = [LPCalendarDate firstWeekdayInThisMonth:date];
    //  3.days (1-31)
    for (int i = 0; i < _daysArray.count; i++) {
        
        int x = (i % 7) * (calendarBtnHeight + padding) + 16;
        int y = (i / 7) * (calendarBtnHeight + 10) + CGRectGetMaxY(weekBg.frame) + 10;
        
        UIButton *dayButton = _daysArray[i];
        
        dayButton.frame = CGRectMake(x, y, calendarBtnHeight, calendarBtnHeight);
        dayButton.clipsToBounds = YES;
        dayButton.layer.cornerRadius = calendarBtnHeight / 2;
        
        dayButton.titleLabel.font = [UIFont systemFontOfSize:14.0];
        dayButton.titleLabel.textAlignment = NSTextAlignmentCenter;
//        dayButton.layer.cornerRadius = 5;
        
        [dayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [dayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
//        [dayButton addTarget:self action:@selector(logDate:) forControlEvents:UIControlEventTouchUpInside];
        
        NSInteger day = 0;
        
        if (i < firstWeekday) {
            day = daysInLastMonth - firstWeekday + i + 1;
            [self setStyle_BeyondThisMonth:dayButton];
            
        }else if (i > firstWeekday + daysInThisMonth - 1){
            day = i + 1 - firstWeekday - daysInThisMonth;
            [self setStyle_BeyondThisMonth:dayButton];
            
        }else{
            day = i - firstWeekday + 1;
            [self setStyle_AfterToday:dayButton];
        }
        
        [dayButton setTitle:[NSString stringWithFormat:@"%li", day] forState:UIControlStateNormal];
        
        // this month
        NSInteger todayIndex = [LPCalendarDate day:[NSDate date]] + firstWeekday - 1;
        
        if([self judgementMonth] && i ==  todayIndex)
        {
            [self setStyle_Today:dayButton];
            _dayButton = dayButton;
        }else
        {
            dayButton.backgroundColor=[UIColor whiteColor];
        }
    }
}


#pragma mark - date button style
//设置不是本月的日期字体颜色   ---白色  看不到
- (void)setStyle_BeyondThisMonth:(UIButton *)btn
{
    btn.enabled = NO;
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = 1.0f;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)setStyle_AfterToday:(UIButton *)btn
{
    btn.enabled = YES;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = 1.0f;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
}

-(BOOL) judgementMonth{
    //获取当前月份
    NSDateFormatter *formatter=[[NSDateFormatter alloc] init];
    formatter.dateFormat=@"MM";
    NSInteger dateMon=[[formatter stringFromDate:[NSDate date]] integerValue];
    
    //获取选择的月份
    NSInteger mon=[[headlabel.text substringFromIndex:5] integerValue];
    
    if (mon==dateMon)
    {
        return YES;
    }else
        return NO;
}

//已经签名的
- (void)setSigned:(UIButton *)btn
{
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    btn.layer.borderWidth = 1.0f;
    btn.layer.borderColor = RGB(45, 180, 255).CGColor;
    btn.layer.borderWidth = 1.0f;
    [btn setBackgroundColor:[UIColor whiteColor]];
}

//设置补的
- (void)setBu:(UIButton *)btn
{
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:RGB(45, 180, 255)];
    
    btn.layer.borderWidth = 1.0f;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)setStyle_Today:(UIButton *)btn
{
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor whiteColor]];
    btn.layer.borderWidth = 1.0f;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
}

-(void) clickMonth:(UIButton *)btn
{
    if (btn==rightButton)
    {
        lpDate=[LPCalendarDate nextMonth:lpDate];
    }else
    {
        lpDate=[LPCalendarDate lastMonth:lpDate];
    }

    NSDate *date=lpDate;
    
//    headlabel.text = [NSString stringWithFormat:@"%li年%li月",[LPCalendarDate year:date],[LPCalendarDate month:date]];
    
    [headlabel setText:[NSString stringWithFormat:@"%li年%@月",[LPCalendarDate year:date],[self transformInter:[LPCalendarDate month:date]]]];
    
    NSInteger daysInLastMonth = [LPCalendarDate totaldaysInMonth:[LPCalendarDate lastMonth:date]];
    NSInteger daysInThisMonth = [LPCalendarDate totaldaysInMonth:date];
    NSInteger firstWeekday    = [LPCalendarDate firstWeekdayInThisMonth:date];
    
    NSInteger todayIndex = [LPCalendarDate day:[NSDate date]] + firstWeekday - 1;
    
    for (int i = 0; i < 42; i++) {
        
        UIButton *dayButton = _daysArray[i];
        
        NSInteger day = 0;
        
        if (i < firstWeekday) {
            day = daysInLastMonth - firstWeekday + i + 1;
            [self setStyle_BeyondThisMonth:dayButton];
            
        }else if (i > firstWeekday + daysInThisMonth - 1){
            day = i + 1 - firstWeekday - daysInThisMonth;
            [self setStyle_BeyondThisMonth:dayButton];
            
        }else{
            day = i - firstWeekday + 1;
            [self setStyle_AfterToday:dayButton];
        }
        
        [dayButton setTitle:[NSString stringWithFormat:@"%li",day] forState:UIControlStateNormal];
        
        // this month
        if([self judgementMonth] && i ==  todayIndex)
        {
            [self setStyle_Today:dayButton];
            _dayButton = dayButton;
        }else
        {
            dayButton.backgroundColor=[UIColor whiteColor];
        }
    }
}

- (void)logDate:(UIButton *)button{
    [_dayButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_dayButton setBackgroundColor:[UIColor whiteColor]];
//    NSLog(@"获取到的当前的时间是:");
    [self setStyle_Today:button];
    _dayButton = button;
    self.calendarAlertViewBlock([NSString stringWithFormat:[NSString stringWithFormat:@"%li-%@-%@",[LPCalendarDate year:lpDate],[self transformInter:[LPCalendarDate month:lpDate]],_dayButton.currentTitle]]);
}

- (NSString *)transformInter:(NSInteger)inter{
    if(inter < 10){
        NSString *interStr = [NSString stringWithFormat:@"0%li",inter];
        return interStr;
    }
    return  [NSString stringWithFormat:@"%li",inter];;
}

//取消按钮的操作
- (void)cancleButtonClick:(UIButton *)button{
    self.cancleSheetBlock();
}

@end
