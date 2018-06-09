//
//  ATMineVIPCell.h
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/14.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^memberClick)(NSString * moonStr);
typedef void(^moonSelect)(NSString * moonStr);
@interface ATMineVIPCell : UITableViewCell

@property(nonatomic,strong)UIButton * moneyButton;
@property(nonatomic,strong)UILabel * momberLabel;
@property(nonatomic,strong)UILabel * discountLabel;
@property(nonatomic,strong)UILabel * moneyLabel;

@property(nonatomic,copy)memberClick menberSelect;
@property(nonatomic,copy)moonSelect moonSelect;

@end
