//
//  ATHomeNavBar.m
//  AiTiTi
//
//  Created by 童城 on 2018/4/25.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATHomeNavBar.h"
#import "ATSelectGradeBtn.h"

@implementation ATHomeNavBar

+ (ATHomeNavBar *)homeNavBar {
    CGRect frame = CGRectMake(0, 0, ATScreenWidth, navigationH);
    ATHomeNavBar *homeBar = [[self alloc] init];
    if (iPhoneX) {
        frame.size.height += 24;
        for (UIView *subV in homeBar.subviews) {
            subV.y += 24;
        }
    }
    homeBar.frame = frame;
    return homeBar;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self makeUI];
    }
    return self;
}

- (void)makeUI {
    self.backgroundColor = [UIColor whiteColor];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(10, 20, 30, 30);
    [leftBtn sizeToFit];
    [leftBtn setImage:[UIImage imageNamed:@"signIn"] forState:UIControlStateNormal];
    leftBtn.adjustsImageWhenHighlighted = NO;
    [leftBtn addTarget:self action:@selector(signInAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    
    ATSelectGradeBtn *midBtn = [[ATSelectGradeBtn alloc] initWithFrame:CGRectMake((ATScreenWidth - 100) * 0.5, 20, 100, 30)];
    [midBtn setTitle:@"高一" forState:UIControlStateNormal];
    [midBtn addTarget:self action:@selector(selectGarde:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:midBtn];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(ATScreenWidth - 10 - 30, 20, 30, 30);
    [rightBtn sizeToFit];
    [rightBtn setImage:[UIImage imageNamed:@"header_add"] forState:UIControlStateNormal];
    rightBtn.adjustsImageWhenHighlighted = NO;
    [rightBtn addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBtn];
    
}

- (void)signInAction:(UIButton *)btn {
     ATLog(@"test");
    
}
- (void)addAction:(UIButton *)btn {
    
     ATLog(@"test");
}


- (void)selectGarde:(ATSelectGradeBtn *)btn {
    ATLog(@"test");
    
}

@end
