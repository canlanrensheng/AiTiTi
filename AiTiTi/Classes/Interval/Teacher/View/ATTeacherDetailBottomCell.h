//
//  ATDetailBottomCell.h
//  AiTiTi
//
//  Created by 童城 on 2018/5/13.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSScrollContentView.h"

@interface ATTeacherDetailBottomCell : UITableViewCell
@property (nonatomic, strong) FSPageContentView *pageContentView;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, assign) BOOL cellCanScroll;
@property (nonatomic, assign) BOOL isRefresh;

@property (nonatomic, strong) NSString *currentTagStr;
@end
