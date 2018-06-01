//
//  ATMacrosUI.h
//  AiTiTi
//
//  Created by 云辉 on 2018/3/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#ifndef ATMacrosUI_h
#define ATMacrosUI_h

//颜色
#define RGBA(r, g, b, a)    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)    RGBA(r, g, b, 1.0f)
#define ATWhite [UIColor whiteColor]
#define ATBlue RGB(88, 179, 249)
#define ATGray RGB(152, 152, 152)
#define kColorSystemReview [UIColor colorWithHexString:@"0xff8a04"]
#define kColorHotSubject [UIColor colorWithHexString:@"0x2db4ff"]
#define kColorTeacherCellGrayText RGB(153,153,153)
#define kColorTeacherCellSelectText RGB(32,32,32)
#define kColorGray51 RGB(51,51,51)

//字体
#define kFONT17 [UIFont systemFontOfSize:17.0f]
#define kFONT16 [UIFont systemFontOfSize:16.0f]
#define kFONT15 [UIFont systemFontOfSize:15.0f]
#define kFONT14 [UIFont systemFontOfSize:14.0f]
#define kFONT13 [UIFont systemFontOfSize:13.0f]
#define kFONT12 [UIFont systemFontOfSize:12.0f]
#define kFONT11 [UIFont systemFontOfSize:11.0f]
#define kFONT10 [UIFont systemFontOfSize:10.0f]

//屏幕尺寸
#define ATScreenWidth [UIScreen mainScreen].bounds.size.width
#define ATScreenHeight [UIScreen mainScreen].bounds.size.height

//当前window
#define ATKeyWindow [UIApplication sharedApplication].keyWindow

// 创建图片
#define IMAGE(imageName)    ([UIImage imageNamed:imageName])

//控件高度
#define tabbarH     49.f
#define navigationH 64.f
#define statusbarH  20.f
#define NavBarHeight (iPhoneX?88:64)

//缩放比例
#define kScaleXFrom_iPhone6_Desgin(_X_) (_X_ * (ATScreenWidth/375))
#define kScaleYFrom_iPhone6_Desgin(_Y_) (_Y_ * (ATScreenHeight/667))

#endif /* ATMacrosUI_h */
