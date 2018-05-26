//
//  BMHudTool.m
//  BM
//
//  Created by txooo on 16/9/7.
//  Copyright © 2017年 张金山. All rights reserved.
//

#import "TXHudTool.h"

@implementation TXHudTool

UIViewController *VisibleViewController() {
    UIViewController *rootVC = [[UIApplication sharedApplication].delegate window].rootViewController;
    while ([rootVC isKindOfClass:[UINavigationController class]]) {
        rootVC = [(UINavigationController *)rootVC visibleViewController];
    }
    while ([rootVC isKindOfClass:[UITabBarController class]]) {
        rootVC = [(UITabBarController *)rootVC selectedViewController];
        if ([rootVC isKindOfClass:[UINavigationController class]]) {
            rootVC = [(UINavigationController *)rootVC visibleViewController];
        }
    }
    return rootVC;
}

UIViewController *getCurrentVC(){
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows){
            if (tmpWin.windowLevel == UIWindowLevelNormal){
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) result = nextResponder;
    else result = window.rootViewController;
    return result;
}

@end
