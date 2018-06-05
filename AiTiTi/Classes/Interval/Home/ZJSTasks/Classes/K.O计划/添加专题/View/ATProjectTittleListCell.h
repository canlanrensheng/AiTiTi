//
//  ATProjectTittleListCell.h
//  AiTiTi
//
//  Created by 张金山 on 2018/6/4.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface ATProjectTittleListCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UILabel *classNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end
