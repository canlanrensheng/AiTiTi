//
//  ATHomeHeader.h
//  AiTiTi
//
//  Created by 童城 on 2018/4/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ATHomeHeader;

@protocol ATHomeHeaderBtnDelegate<NSObject>
- (void)homeHeader:(ATHomeHeader *)homeHeader btnDidClicker:(UIButton *)btn;
@end

@interface ATHomeHeader : UIView
@property (nonatomic,weak) id<ATHomeHeaderBtnDelegate> delegate;
@end
