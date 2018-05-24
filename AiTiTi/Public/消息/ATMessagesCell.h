//
//  ATMessagesCell.h
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/24.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATMessagesModel.h"

typedef void(^MoreClickBlock)(ATMessagesModel * model);

@interface ATMessagesCell : UITableViewCell

@property(nonatomic,strong)ATMessagesModel * model;

@property(nonatomic,strong)UILabel * timeLabel;
@property(nonatomic,strong)UILabel * messagesLabel;
@property(nonatomic,strong)UIImageView * headImg;

@property(nonatomic,copy)MoreClickBlock moreBlock;

@end
