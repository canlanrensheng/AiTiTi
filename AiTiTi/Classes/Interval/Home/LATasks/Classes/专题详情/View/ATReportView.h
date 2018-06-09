//
//  ATReportView.h
//  AiTiTi
//
//  Created by LA on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 举报View
 */
@interface ATReportView : UIView
@property (nonatomic, strong) void (^commitBlock)(void);
- (void)la_show;
- (void)la_dismiss;

@end
