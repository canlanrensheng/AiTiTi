//
//  ATIntervalHeaderView.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/25.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATIntervalHeaderView.h"
#import <SDCycleScrollView.h>

@interface ATIntervalHeaderView()<SDCycleScrollViewDelegate>

@property(nonatomic,strong)SDCycleScrollView *cycleScrollView;

@end

@implementation ATIntervalHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self makeSubViews];
    }
    return self;
}

#pragma mark - UI
-(void)makeSubViews{
    UIImage * cycImg = IMAGE(@"interval_cyc");
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ATScreenWidth, ATScreenWidth/(cycImg.size.width/cycImg.size.height)) delegate:self placeholderImage:IMAGE(@"interval_cyc")];
//    self.cycleScrollView.imageURLStringsGroup = @[];
    self.cycleScrollView.showPageControl = NO;
    [self addSubview:self.cycleScrollView];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"%ld",index);
    if (self.bannerBlock) {
        self.bannerBlock(index);
    }
}

-(void)setBannerArray:(NSMutableArray *)bannerArray{
    _bannerArray = bannerArray;
    UIImage * cycImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:bannerArray[0]]];
    self.cycleScrollView.frame = CGRectMake(0, 0, ATScreenWidth, ATScreenWidth/(cycImg.size.width/cycImg.size.height));
}

@end
