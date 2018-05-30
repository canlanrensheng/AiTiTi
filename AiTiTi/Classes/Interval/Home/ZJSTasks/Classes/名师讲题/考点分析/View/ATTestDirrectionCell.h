//
//  ATTestDirrectionCell.h
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/29.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface ATTestDirrectionCell : BaseTableViewCell

@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UITableView *testDirectionTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeightCon;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backViewHeightCon;

@end
