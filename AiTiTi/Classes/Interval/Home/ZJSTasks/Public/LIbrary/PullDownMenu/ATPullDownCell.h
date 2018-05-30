//
//  ATPullDownCell.h
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATPullDownCell : UITableViewCell

@property (nonatomic,assign) BOOL isSelected;
@property (weak, nonatomic) IBOutlet UILabel *itemTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipImageView;
@property (weak, nonatomic) IBOutlet UIImageView *gouImageView;


@end
