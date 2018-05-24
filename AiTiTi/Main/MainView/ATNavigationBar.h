//
//  ATNavigationBar.h
//  AiTiTi
//
//  Created by 童城 on 2018/4/23.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ATNavigationBarDelegate <NSObject>

@optional
-(void)backItemClick;
-(void)nextItemClick;

@end

@interface ATNavigationBar : UIView
@property (nonatomic,weak) id <ATNavigationBarDelegate>delegate;
@property (nonatomic, assign) BOOL leftBtnHiden;
@property (nonatomic, assign) BOOL rightBtnHiden;

- (id)initWithFrame:(CGRect)frame title:(NSString *)title leftName:(NSString *)leftName rightName:(NSString *)rightName;


/** 
 @param title    标题
 @param leftName 左边返回按钮标题
 @param rightName 右边按钮文字
 @return 导航栏
 */
- (id)initWithTitle:(NSString *)title leftName:(NSString *)leftName rightName:(NSString *)rightName delegate:(id<ATNavigationBarDelegate>)delegate;

@end
