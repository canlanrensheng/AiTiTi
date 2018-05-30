//
//  ATExamPaperSectionView.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/28.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATExamPaperSectionView.h"

@implementation ATExamPaperSectionView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.difficultTypeLabel.clipsToBounds = YES;
    self.difficultTypeLabel.layer.cornerRadius = 9.5f;
}

- (RACSubject *)openButtonSubject{
    if(!_openButtonSubject){
        _openButtonSubject = [[RACSubject alloc] init];
    }
    return  _openButtonSubject;
}

- (IBAction)openButtonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    [self.openButtonSubject sendNext:@(sender.selected)];
}

@end
