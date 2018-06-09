//
//  ATEvaluationBottomTool.h
//  AiTiTi
//
//  Created by LA on 2018/6/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseView.h"

/**
 测评底部工具条
 */
@interface ATEvaluationBottomTool : BaseView

@property (nonatomic, copy) dispatch_block_t collegeExaminationBtnBlock;
@property (nonatomic, copy) dispatch_block_t unitTestingBtnBlock;

@end
