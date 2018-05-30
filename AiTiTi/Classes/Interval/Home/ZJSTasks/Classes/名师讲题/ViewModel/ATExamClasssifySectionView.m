//
//  ATExamClasssifySectionView.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/28.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATExamClasssifySectionView.h"

@interface ATExamClasssifySectionView()


@end

@implementation ATExamClasssifySectionView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.itemTypeLabel.clipsToBounds = YES;
    self.itemTypeLabel.layer.cornerRadius = 11.0f;
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
