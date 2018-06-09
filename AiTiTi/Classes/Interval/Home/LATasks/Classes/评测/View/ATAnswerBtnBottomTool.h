//
//  ATAnswerBtnBottomTool.h
//  AiTiTi
//
//  Created by LA on 2018/6/7.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseView.h"

/**
 答题 A B C D 工具条
 */
@interface ATAnswerBtnBottomTool : BaseView
@property (nonatomic, copy) void (^nextAnswerBtnBlock)(UIButton *btn,NSInteger tag);


@end
