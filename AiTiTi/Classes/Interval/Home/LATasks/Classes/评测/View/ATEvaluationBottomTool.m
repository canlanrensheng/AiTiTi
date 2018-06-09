//
//  ATEvaluationBottomTool.m
//  AiTiTi
//
//  Created by LA on 2018/6/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATEvaluationBottomTool.h"

@implementation ATEvaluationBottomTool
- (IBAction)collegeExaminationBtn:(UIButton *)sender {
    if (self.collegeExaminationBtnBlock) {
        self.collegeExaminationBtnBlock();
    }
}
- (IBAction)unitTestingBtn:(UIButton *)sender {
    if (self.unitTestingBtnBlock) {
        self.unitTestingBtnBlock();
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
