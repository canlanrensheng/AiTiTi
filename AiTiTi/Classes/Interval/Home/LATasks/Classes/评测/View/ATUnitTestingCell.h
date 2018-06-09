//
//  ATUnitTestingCell.h
//  AiTiTi
//
//  Created by LA on 2018/6/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseTableViewCell.h"
@class ATUnitTestingModel;
UIKIT_EXTERN NSString * const kATUnitTestingCell;

/**
 单元测试cell
 */
@interface ATUnitTestingCell : BaseTableViewCell
+ (instancetype)getTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, strong)ATUnitTestingModel *model;
@end
