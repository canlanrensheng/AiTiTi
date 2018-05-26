//
//  ATSignCalendarCell.h
//  AiTiTi
//
//  Created by 张金山 on 2018/5/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface ATSignCalendarCell : BaseTableViewCell
@property (weak, nonatomic) IBOutlet UIView *backView;
@property (weak, nonatomic) IBOutlet UIButton *signButton;
- (IBAction)signButtonClick:(id)sender;

@end
