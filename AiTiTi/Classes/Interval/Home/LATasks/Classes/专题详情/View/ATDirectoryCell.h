//
//  ATDirectoryCell.h
//  AiTiTi
//
//  Created by LA on 2018/5/28.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 专题详情--->目录cell
 */
UIKIT_EXTERN NSString * const kATDirectoryCell;
@interface ATDirectoryCell : UITableViewCell
+ (instancetype)getTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end
