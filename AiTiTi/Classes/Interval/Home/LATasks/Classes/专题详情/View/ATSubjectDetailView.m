//
//  ATSubjectDetailView.m
//  AiTiTi
//
//  Created by LA on 2018/5/27.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubjectDetailView.h"

@implementation ATSubjectDetailView

+ (ATSubjectDetailView *)subjectDetailHeaderView {
    ATSubjectDetailView *headerDetailView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ATSubjectDetailView class]) owner:nil options:nil] lastObject];
    
    return headerDetailView;
}

@end
