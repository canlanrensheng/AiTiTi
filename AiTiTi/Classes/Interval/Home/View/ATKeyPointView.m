//
//  ATKeyPointView.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATKeyPointView.h"
#define imgScale 200.0/280
#define leading 12

@implementation ATKeyPointView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self makeUI];
    }
    return self;
}
- (void)makeUI {
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(leading, leading, self.width - leading * 2, 200)];
    scrollView.showsHorizontalScrollIndicator = NO;
    [self addSubview:scrollView];
    
   UIView *hotView = [self subViewWithFrame:CGRectMake(0, 0, 140, 100) Title:@"HOT" subTitle:@"鼎力推荐好书" image:[UIImage imageNamed:@"keypoint_hot"]];
   UIView *newView = [self subViewWithFrame:CGRectMake(hotView.right + leading, 0, 140, 100) Title:@"NEW" subTitle:@"鼎力推荐好书" image:[UIImage imageNamed:@"keypoint_new"]];
   UIView *preeView = [self subViewWithFrame:CGRectMake(newView.right + leading, 0, 140, 100) Title:@"PREE" subTitle:@"鼎力推荐好书" image:[UIImage imageNamed:@"keypoint_pree"]];
    
    scrollView.contentSize = CGSizeMake(preeView.right, preeView.height);
    scrollView.height = preeView.height;
    
    
    [scrollView addSubview:hotView];
    [scrollView addSubview:newView];
    [scrollView addSubview:preeView];
}

- (UIView *)subViewWithFrame:(CGRect)frame Title:(NSString *)title subTitle:(NSString *)subTitle image:(UIImage *)image {
    UIView *bgView = [[UIView alloc] initWithFrame:frame];
    bgView.backgroundColor = [UIColor whiteColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 25)];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [bgView addSubview:titleLabel];
    
    UILabel *subTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, titleLabel.bottom, frame.size.width, 16)];
    subTitleLabel.text = subTitle;
    subTitleLabel.font = [UIFont systemFontOfSize:12];
    [bgView addSubview:subTitleLabel];
    
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, subTitleLabel.bottom + 5, frame.size.width, frame.size.width * imgScale)];
    imgView.image = image;
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    [bgView addSubview:imgView];
    
    bgView.height = imgView.bottom;
    
    return bgView;
}


@end
