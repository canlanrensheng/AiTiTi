//
//  ATContentViewCell.h
//  AiTiTi
//
//  Created by LA on 2018/5/29.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSScrollContentView.h"

/**
 专题详情--->子标签
 */
@interface ATContentViewCell : UITableViewCell
@property (nonatomic, strong) FSPageContentView *pageContentView;
@property (nonatomic, strong) NSMutableArray *viewControllers;
@property (nonatomic, assign) BOOL cellCanScroll;
@property (nonatomic, assign) BOOL isRefresh;

@property (nonatomic, strong) NSString *currentTagStr;
@end
