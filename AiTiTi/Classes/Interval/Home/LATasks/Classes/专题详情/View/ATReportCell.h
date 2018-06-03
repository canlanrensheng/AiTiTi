//
//  ATReportCell.h
//  AiTiTi
//
//  Created by LA on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>
UIKIT_EXTERN NSString * const kATReportCell;

@interface ATReportCell : UITableViewCell
+ (instancetype)getTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@end
