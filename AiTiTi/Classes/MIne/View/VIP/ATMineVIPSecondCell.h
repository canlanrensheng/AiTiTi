//
//  ATMineVIPSecondCell.h
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/14.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^payBlock)(void);

@interface ATMineVIPSecondCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)UILabel * rechargeLabel;
@property(nonatomic,strong)NSMutableArray * rechargeArray;

@property(nonatomic,copy)payBlock payBlock;

@end
