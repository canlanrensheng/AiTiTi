//
//  ATSubjectListDetailCell.h
//  AiTiTi
//
//  Created by LA on 2018/6/7.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseTableViewCell.h"
UIKIT_EXTERN NSString * const kATSubjectListDetailCell;

/**
 专题列表详情cell
 */
@interface ATSubjectListDetailCell : BaseTableViewCell
+ (instancetype)getTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;
@end
