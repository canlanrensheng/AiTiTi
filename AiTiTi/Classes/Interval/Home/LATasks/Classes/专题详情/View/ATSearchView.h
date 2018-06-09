//
//  ATSearchView.h
//  AiTiTi
//
//  Created by LA on 2018/1/1.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATSearchView : UIView
@property (nonatomic, copy) void (^publishBlock)(NSString *);
@end
