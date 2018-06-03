//
//  YSQDrodownMenu.h
//  LACarry
//
//  Created by LACarry on 16/6/1.
//  Copyright © 2016年 LACarry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class YSQDrodownMenu;
@protocol YSQDrodownMenuDelegate <NSObject>

@optional
- (void)dropdownMenuDidDismiss:(YSQDrodownMenu *)menu;
- (void)dropdownMenuDidShow:(YSQDrodownMenu *)menu;

@end
@interface YSQDrodownMenu : UIView
{
    UIWindow *w;
}
@property (nonatomic,strong) UIButton *bgview;
@property (nonatomic, weak) id<YSQDrodownMenuDelegate> delegate;
+ (instancetype)menu;
- (void)show;
- (void)showAlert;
- (void)dismiss;
- (void)dismissAlert;
/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;
/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;

@property (nonatomic, assign) CGFloat contentY;
@end
