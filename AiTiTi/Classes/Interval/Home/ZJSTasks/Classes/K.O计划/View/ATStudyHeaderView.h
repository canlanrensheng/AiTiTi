//
//  ATStudyHeaderView.h
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseView.h"

@interface ATStudyHeaderView : BaseView
//计划安排按钮
@property (weak, nonatomic) IBOutlet UIButton *planButton;
//新建计划按钮
@property (weak, nonatomic) IBOutlet UIButton *createPlanButton;
//开始学习按钮
@property (weak, nonatomic) IBOutlet UIButton *startStudyButton;

@end
