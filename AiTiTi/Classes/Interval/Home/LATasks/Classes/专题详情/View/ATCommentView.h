//
//  ATCommentView.h
//  AiTiTi
//
//  Created by LA on 2018/5/31.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 写评论
 */
@interface ATCommentView : UIView
@property (nonatomic, copy) void (^writeBtnBlock)(void);
@end
