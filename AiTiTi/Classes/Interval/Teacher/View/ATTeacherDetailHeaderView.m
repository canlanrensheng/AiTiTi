//
//  ATTeacherDetailHeaderView.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/9.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTeacherDetailHeaderView.h"

@implementation ATTeacherDetailHeaderView

+ (ATTeacherDetailHeaderView *)headerView {
    ATTeacherDetailHeaderView *headerView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ATTeacherDetailHeaderView class]) owner:nil options:nil] firstObject];
    return headerView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
