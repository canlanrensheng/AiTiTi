//
//  ATStudyPlanCalenderAlertView.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/6/1.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATStudyPlanCalenderAlertView.h"

//#import "UIImage+ZJSImageColor.h"
//#import "UIView+ZJSViewFrame.h"
#import "ATStudyPlanCalendarView.h"
@interface ATStudyPlanCalenderAlertView ()

@property (nonatomic, strong) UIButton *backgroudView;

@property (nonatomic, strong) UIView *actionSheetView;

@property (nonatomic,assign) CGRect selectFrame;

@property (nonatomic,strong) ATStudyPlanCalendarView *calendarView;


@end


@implementation ATStudyPlanCalenderAlertView


- (instancetype)initWithFrame:(CGRect)frame
             actionSheetBlock:(calendarAlertViewBlock)actionSheetBlock
             cancleSheetBlock:(cancleAlertViewBlock)cancleSheetBlock{
    self = [super initWithFrame:frame];
    if (self) {
        //        frame.origin.y += kNavigationBarHeight;
        if (actionSheetBlock) {
            self.acitonSheetBlock = actionSheetBlock;
        }
        if (cancleSheetBlock) {
            self.cancleSheetBlock = cancleSheetBlock;
        }
        self.selectFrame = frame;
        //        [self addSubview:self.actionSheetView];
        [self ZJS_setupZJSActionSheetViewSubviews];
    }
    return self;
}


#pragma mark - private methods
- (void)ZJS_setupZJSActionSheetViewSubviews{
    [self setFrame:self.selectFrame];
    [self addSubview:self.backgroudView];
    [self addSubview:self.actionSheetView];
    [self.actionSheetView addSubview:self.calendarView];
    [self.backgroudView setFrame:CGRectMake(0, 0, self.width,  self.height)];
    
    CGFloat height =  29 + 20 + 30 + 20 + 30 + 6 * 40;
    [self.actionSheetView setFrame:CGRectMake(0, 0, self.frame.size.width, height)];
}

#pragma mark - public methods
- (void)show{
    [self showInView:[UIApplication sharedApplication].delegate.window];
}


- (void)showInView:(UIView *)view{
    if (nil == view) {
        view = [UIApplication sharedApplication].delegate.window;
    }
    [view addSubview:self];
    [self.backgroudView setBackgroundColor:[UIColor clearColor]];
    [self ZJS_setupZJSActionSheetViewSubviews];
    self.actionSheetView.hidden = NO;
    [self.backgroudView setBackgroundColor:[UIColor colorWithWhite:0.0 alpha:0.4]];
}

#pragma mark - operation methods

- (void)ZJS_didTapBackground:(id)sender{
    if (self.cancleSheetBlock) {
        self.cancleSheetBlock();
    }
    [self dismiss];
}


#pragma mark -
- (void)dismiss{
    CGRect rect = CGRectMake(0, 0, self.width, 0);
    //    [UIView animateWithDuration:1.0f animations:^{
    [self.actionSheetView setFrame:rect];
    self.actionSheetView.hidden = YES;
    [self.backgroudView setBackgroundColor:[UIColor clearColor]];
    [self removeFromSuperview];
    //    }];
    
}

- (void)removeSubView{
    CGRect rect = CGRectMake(0, 0, self.width, 0);
    [UIView animateWithDuration:1.5f animations:^{
        [self.actionSheetView setFrame:rect];
        [self.backgroudView setBackgroundColor:[UIColor clearColor]];
        //        [self removeFromSuperview];
    }];
}


#pragma mark - 懒加载初始化视图
- (UIButton *)backgroudView{
    if (_backgroudView == nil) {
        _backgroudView = [[UIButton alloc] init];
        [_backgroudView setBackgroundColor:[UIColor blueColor]];
        [_backgroudView addTarget:self action:@selector(ZJS_didTapBackground:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroudView;
}

- (UIView *)actionSheetView{
    if (_actionSheetView == nil) {
        _actionSheetView = [[UIView alloc] init];
        [_actionSheetView setBackgroundColor:[UIColor whiteColor]];
    }
    return _actionSheetView;
}

- (ATStudyPlanCalendarView *)calendarView{
    if(!_calendarView){
       CGFloat height = 29 + 20 + 30 + 20 + 30 + 6 * 40;
        _calendarView = [[ATStudyPlanCalendarView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, height) cancleBlock:^{
            _cancleSheetBlock();
        } calendarAlertViewBlock:^(NSString *dateString) {
            _acitonSheetBlock(dateString);
            [self dismiss];
        }];
        _calendarView.date=[NSDate date];
    }
    return _calendarView;
}



@end



