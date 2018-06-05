//
//  ATClassListSectionHeaderView.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATClassListSectionHeaderView.h"
#import "ATSelectClassViewController.h"
@implementation ATClassListSectionHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.addClassButton clipWithCornerRadius:12.5 borderColor:RGB(102, 102, 102) borderWidth:1.0];
}

- (IBAction)addClassButtonClick:(id)sender {
    ATSelectClassViewController *addSelectClassVC = [[ATSelectClassViewController alloc] init];
    [VisibleViewController().navigationController pushViewController:addSelectClassVC animated:YES];
}
@end
