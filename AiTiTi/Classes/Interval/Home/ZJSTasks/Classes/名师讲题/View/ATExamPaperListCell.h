//
//  ATExamPaperListCell.h
//  AiTiTi
//
//  Created by 张金山 on 2018/5/28.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface ATExamPaperListCell : BaseTableViewCell

- (IBAction)openButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *difficultTypeLabel;

@end
