//
//  ATSubSelectView.h
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/16.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^backBlock)(void);

@interface ATSubSelectView : UIView

@property (nonatomic,copy) backBlock backBlock;
@property (nonatomic,strong) UILabel * titleLabel;
@property (nonatomic,strong) UILabel * subjectLabel;
@property (nonatomic,strong) UILabel * subjectLabel2;

@end
