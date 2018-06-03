//
//  ATCommentMenuView.h
//  AiTiTi
//
//  Created by LA on 2018/5/31.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 评论View
 */
@interface ATCommentMenuView : UIView
@property (nonatomic, copy) void (^commitBtnBlock)(NSString *text);
- (void)la_show;
- (void)la_dismiss;

@end
