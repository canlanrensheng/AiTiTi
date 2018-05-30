//
//  ATStudyHeaderView.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATStudyHeaderView.h"

@implementation ATStudyHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.planButton clipWithCornerRadius:13.5 borderColor:ATWhite borderWidth:1.0];
    [self.createPlanButton clipWithCornerRadius:13.5 borderColor:ATWhite borderWidth:1.0];
    [self.startStudyButton clipWithCornerRadius:18 borderColor:ATWhite borderWidth:1.0];
}



@end
