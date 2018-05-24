//
//  ATQRCodeViewController.h
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/18.
//  Copyright © 2018年 云辉. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import <LBXScanViewController.h>

typedef void(^QRCodeBlock)(NSString * codeStr);

@interface ATQRCodeViewController : LBXScanViewController

/**
 @brief  扫码区域上方提示文字
 */
@property (nonatomic, strong) UILabel *topTitle;

@property (nonatomic, strong) UIImageView *buttomView;

@property (nonatomic, strong) UIImageView *flashView;

@property(nonatomic,copy)QRCodeBlock QRCodeBlock;

@end
