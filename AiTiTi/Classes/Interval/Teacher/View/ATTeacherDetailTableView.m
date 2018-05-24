//
//  ATDetailTableView.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/13.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTeacherDetailTableView.h"

@implementation ATTeacherDetailTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

/**
同时识别多个手势

@param gestureRecognizer gestureRecognizer description
@param otherGestureRecognizer otherGestureRecognizer description
@return return value description
*/
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
