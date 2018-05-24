//
//  ATHomeHeader.m
//  AiTiTi
//
//  Created by 童城 on 2018/4/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATHomeHeader.h"
#import <SDCycleScrollView.h>
#import "ATHeaderBtn.h"

#define leading 12
#define headerScale 324.0/719.0

@interface ATHomeHeader ()<SDCycleScrollViewDelegate>

@end


@implementation ATHomeHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self makeUI];
    }
    return self;
}

- (void)makeUI {
    // 轮播图
    SDCycleScrollView *scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(leading, 0, ATScreenWidth - 2 * leading, (ATScreenWidth - 2 * leading) * headerScale) delegate:self placeholderImage:[UIImage imageNamed:@""]];
    scrollView.localizationImageNamesGroup = @[@"banner_01",@"banner_02",@"banner_01"];
    scrollView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    scrollView.layer.cornerRadius = 8.0;
    scrollView.layer.masksToBounds = YES;
    
    // 添加阴影层
    CALayer *shadowlayer = [[CALayer alloc] init];
    shadowlayer.frame = scrollView.frame;
    shadowlayer.backgroundColor = [UIColor whiteColor].CGColor;
    shadowlayer.shadowColor = [UIColor blackColor].CGColor;
    shadowlayer.shadowOffset = CGSizeMake(0, 8);
    shadowlayer.shadowOpacity = 0.3;
    shadowlayer.shadowRadius = 10;
    shadowlayer.cornerRadius = 6.0;
    [self.layer addSublayer:shadowlayer];
    
    [self addSubview:scrollView];
    
    CGFloat btnWH = 52.f;
    CGFloat centerBtnWH = 65.f;
    CGFloat margin = (ATScreenWidth - (btnWH*4 + centerBtnWH + leading*2)) / 4.0;
    CGFloat top = 35.f;
    CGFloat centerTop = 22.f;
    
    ATHeaderBtn *subjectBtn = [ATHeaderBtn buttonWithFrame:CGRectMake(leading, scrollView.bottom + top, btnWH, btnWH+30) image:[UIImage imageNamed:@"header_subject"] title:@"专题" target:self selector:@selector(btnClick:)];
    ATHeaderBtn *courseBtn = [ATHeaderBtn buttonWithFrame:CGRectMake(leading + btnWH + margin, scrollView.bottom + top, btnWH, btnWH+30) image:[UIImage imageNamed:@"header_course"] title:@"系统课" target:self selector:@selector(btnClick:)];
    ATHeaderBtn *teacherBtn = [ATHeaderBtn buttonWithFrame:CGRectMake(leading+(btnWH+margin)*2, scrollView.bottom + centerTop, centerBtnWH, centerBtnWH+30) image:[UIImage imageNamed:@"header_teacher"] title:@"名师讲题" target:self selector:@selector(btnClick:)];
    ATHeaderBtn *koBtn = [ATHeaderBtn buttonWithFrame:CGRectMake(leading+btnWH *2+margin *3+centerBtnWH, scrollView.bottom + top, btnWH, btnWH+30) image:[UIImage imageNamed:@"header_ko"] title:@"K.O计划" target:self selector:@selector(btnClick:)];
    ATHeaderBtn *evaluationBtn = [ATHeaderBtn buttonWithFrame:CGRectMake(leading+btnWH * 3+margin * 4+centerBtnWH, scrollView.bottom + top, btnWH, btnWH+30) image:[UIImage imageNamed:@"header_evaluation"] title:@"评测" target:self selector:@selector(btnClick:)];
    
    [self addSubview:subjectBtn];
    [self addSubview:courseBtn];
    [self addSubview:teacherBtn];
    [self addSubview:koBtn];
    [self addSubview:evaluationBtn];
    
    // 重新计算高度
    self.height = scrollView.height + centerTop + teacherBtn.height;
}


- (void)btnClick:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(homeHeader:btnDidClicker:)]) {
        [self.delegate homeHeader:self btnDidClicker:btn];
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
