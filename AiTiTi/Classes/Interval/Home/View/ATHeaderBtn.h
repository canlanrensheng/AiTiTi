//
//  ATHeaderBtn.h
//  AiTiTi
//
//  Created by 童城 on 2018/5/5.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATHeaderBtn : UIButton
+ (ATHeaderBtn *)buttonWithFrame:(CGRect)frame image:(UIImage *)image title:(NSString *)title target:(id)target selector:(SEL)selector;
@end
