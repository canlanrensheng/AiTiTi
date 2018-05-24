//
//  ATDetailContentController.h
//  AiTiTi
//
//  Created by 童城 on 2018/5/13.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSuperViewController.h"

@interface ATDetailContentController : ATSuperViewController
@property (nonatomic, assign) BOOL vcCanScroll;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) BOOL isRefresh;
@property (nonatomic, strong) NSString *str;
@end
