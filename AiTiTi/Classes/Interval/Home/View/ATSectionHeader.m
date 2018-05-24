//
//  ATSectionHeader.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSectionHeader.h"
#define kSectionHeaderHeight 40

@implementation ATSectionHeader


+ (ATSectionHeader *)sectionHeaderWithImage:(UIImage *)image title:(NSString *)title subTitle:(NSString *)subTitle {
    ATSectionHeader *header = [[self alloc] initWithFrame:CGRectMake(0, 0, ATScreenWidth, kSectionHeaderHeight)];
    header.backgroundColor = [UIColor whiteColor];
    UIImageView *leftImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, header.height - 21, 17, 21)];
    leftImg.image = image;
    [header addSubview:leftImg];
    
    if (subTitle.length) {
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(header.width - 90 - 12, header.height - 20, 90, 20);
        [rightBtn setTitle:subTitle forState:UIControlStateNormal];
        [rightBtn.titleLabel setFont:[UIFont systemFontOfSize:12]];
        [rightBtn setTitleColor:RGB(32, 32, 32) forState:UIControlStateNormal];
        [rightBtn setImage:[UIImage imageNamed:@"arrow_right"] forState:UIControlStateNormal];
        [rightBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 5)];
        [rightBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 85, 0, 0)];
        [header addSubview:rightBtn];
    }
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftImg.right + 9, leftImg.y, 200, leftImg.height)];
    titleLabel.text = title;
    [header addSubview:titleLabel];
    
    return header;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
