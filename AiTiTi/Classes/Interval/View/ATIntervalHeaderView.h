//
//  ATIntervalHeaderView.h
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/25.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^bannerClickBlock)(NSInteger index);

@interface ATIntervalHeaderView : UIView

@property(nonatomic,strong)NSMutableArray * bannerArray;
@property(nonatomic,copy)bannerClickBlock bannerBlock;

@end
