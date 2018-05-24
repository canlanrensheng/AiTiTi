//
//  ATSubjectSectionHeader.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/17.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubjectSectionHeader.h"

@interface ATSubjectSectionHeader ()
@end

@implementation ATSubjectSectionHeader

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (ATSubjectSectionHeader *)subjectSectionHeaderWithModel {
    ATSubjectSectionHeader *sectionHeader = [[ATSubjectSectionHeader alloc] init];
    sectionHeader.frame = CGRectMake(0, 0, ATScreenWidth, 64);
    sectionHeader.backgroundColor = [UIColor cyanColor];
    
   UILabel *titleLabel = [UILabel labelWithTitle:@"集合与函数" color:RGB(51, 51, 51) fontSize:17.0 alignment:NSTextAlignmentLeft];
    [sectionHeader addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(sectionHeader.mas_left).with.offset(20);
        make.centerY.mas_equalTo(sectionHeader.mas_centerY);
    }];
  
    UIImageView *arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"subject_gray_arrow_down"]];
    [arrow sizeToFit];
    arrow.tag = 1001;
    [sectionHeader addSubview:arrow];
    [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(sectionHeader.mas_right).with.offset(-20);
        make.centerY.mas_equalTo(sectionHeader.mas_centerY);
    }];
    
   UILabel *numLabel = [UILabel labelWithTitle:@"15/38" color:RGB(153, 153, 153) fontSize:14 alignment:NSTextAlignmentCenter];
    [sectionHeader addSubview:numLabel];
    [numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(arrow.mas_left).offset(-15);
        make.centerY.mas_equalTo(sectionHeader.mas_centerY);
    }];
    
    return sectionHeader;
}

- (void)changeArrowDirection {
    
    [UIView animateWithDuration:0.25 animations:^{
        UIImageView *arrow = (UIImageView *)[self viewWithTag:1001];
        arrow.transform = CGAffineTransformRotate(arrow.transform, M_PI);
    }];
}

@end
