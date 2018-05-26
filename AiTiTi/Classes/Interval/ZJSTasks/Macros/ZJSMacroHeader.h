//
//  ZJSMacroHeader.h
//  AiTiTi
//
//  Created by 张金山 on 2018/5/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#ifndef ZJSMacroHeader_h
#define ZJSMacroHeader_h

#define isiphoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define kStatusBarHeight        [[UIApplication sharedApplication] statusBarFrame].size.height
#define kTopBarHeight           (44.f)
#define kNavigationBarHeight    (isiphoneX ? 88 : 64)
#define kBottomBarHeight        (isiphoneX ? 83 : 49)
#define KHomeIndicatorHeight    (isiphoneX ? 34 : 0)

#endif /* ZJSMacroHeader_h */
