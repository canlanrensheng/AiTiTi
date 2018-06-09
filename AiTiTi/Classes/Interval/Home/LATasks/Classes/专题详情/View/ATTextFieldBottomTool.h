//
//  ATTextFieldBottomTool.h
//  AiTiTi
//
//  Created by LA on 2018/6/4.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseView.h"

/**
 评论回复底部textField工具条
 */
@interface ATTextFieldBottomTool : BaseView
@property (nonatomic, copy) void (^releaseBtnBlock)(NSString *);
@end
