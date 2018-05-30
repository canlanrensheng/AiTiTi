//
//  ATCommentCell.h
//  AiTiTi
//
//  Created by LA on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 专题详情-->评价cell
 */
UIKIT_EXTERN NSString * const kATCommentCell;

@interface ATCommentCell : UITableViewCell
+ (instancetype)getTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath;

@end
