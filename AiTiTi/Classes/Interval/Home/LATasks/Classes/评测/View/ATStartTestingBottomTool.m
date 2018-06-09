//
//  ATStartTestingBottomTool.m
//  AiTiTi
//
//  Created by LA on 2018/6/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATStartTestingBottomTool.h"

@implementation ATStartTestingBottomTool
- (IBAction)startTestingBtn:(UIButton *)sender {
    if (self.startTestingBtnBlock) {
        self.startTestingBtnBlock();
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
