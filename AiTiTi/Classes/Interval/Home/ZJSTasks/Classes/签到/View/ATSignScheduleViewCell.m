//
//  ATSignScheduleViewCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSignScheduleViewCell.h"

@implementation ATSignScheduleViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    NSArray *imgArr = @[@"10倍1",@"会员",@"VIP",@"勋章"];
    NSArray *titleArr = @[@"未激活",@"未激活",@"未激活",@"未激活"];
    [self reloadImgScrollViewWithImgArr:imgArr titleArr:titleArr];
}

- (void)reloadImgScrollViewWithImgArr:(NSArray *)imgArr titleArr:(NSArray *)tltleArr{
    [[_scrollView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    NSUInteger assetCount = 4;
    CGFloat padding  = 10;
    CGFloat width = (Screen_Width - 30 - (assetCount - 1) * padding) / assetCount;
    self.scrollViewHeight.constant = width + 25;
    for (NSInteger i = 0; i < assetCount; i++) {
        UIView *backView = [[UIView alloc] init];
        backView.backgroundColor = [UIColor clearColor];
        backView.frame = CGRectMake((width + padding) * i, 0, width, width + 25);
        [_scrollView addSubview:backView];
        
        UIImageView * imageV = [[UIImageView alloc] init];
//        imageV.frame = CGRectMake((width + padding) * i, 0, width, width);
        imageV.backgroundColor = Background_Color;
        imageV.clipsToBounds = YES;
        imageV.layer.cornerRadius = width / 2.0;
        imageV.image = IMAGE(imgArr[i]);
//        [imageV sd_setImageWithURL:[NSURL URLWithString:[imgArr[i]addUrlImgScalePropertyWithUrlIconScaleType:UrlIconScaleTypeHalfScreen]] placeholderImage:[UIImage imageNamed:@"nologo"]];
        imageV.userInteractionEnabled = NO;
        imageV.tag = i;
        [backView addSubview:imageV];
        [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(backView);
            make.centerX.equalTo(backView);
            make.size.mas_equalTo(CGSizeMake(width, width));
        }];
        
       UILabel *scheleLabel = [UILabel labelWithTitle:@"未激活" color:RGB(45, 180, 255) font:[UIFont systemFontOfSize:12] alignment:NSTextAlignmentCenter];
        [backView addSubview:scheleLabel];
//        [scheleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerX.equalTo(imageV);
//            make.top.equalTo(imageV.mas_bottom).offset(8);
//        }];
        [scheleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(imageV.mas_bottom).offset(8);
            make.centerX.equalTo(backView);
        }];
    }
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, CGRectGetMaxY([[_scrollView.subviews lastObject] frame]));
}
@end
