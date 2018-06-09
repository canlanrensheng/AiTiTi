//
//  ATClassListSectionHeaderView.h
//  AiTiTi
//
//  Created by 张金山 on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseView.h"

@interface ATClassListSectionHeaderView : BaseView
@property (weak, nonatomic) IBOutlet UIButton *addClassButton;
- (IBAction)addClassButtonClick:(id)sender;

@end
