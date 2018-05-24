//
//  ATSubjectHeader.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/15.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubjectHeader.h"
#import "ATSubjectSelectBtn.h"
#import "ATSubjectSpreadCell.h"

@interface ATSubjectHeader ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) UIView *maskView;
@property (nonatomic,weak) UITableView *spreadView;
@property (nonatomic,weak) UIView *bgView;
@end

static NSString *cellID = @"ATSubjectSpreadCell";
@implementation ATSubjectHeader

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
    self.backgroundColor = [UIColor whiteColor];
    
    UIWindow *alertWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self addSubview:alertWindow];
    alertWindow.windowLevel = UIWindowLevelAlert;
    UIView *maskView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    _maskView = maskView;
    maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    [alertWindow addSubview:maskView];
    
    UITableView *spreadView = [UITableView tableViewWithFrmae:CGRectMake(0, 0, ATScreenWidth, 300) backgroundColor:[UIColor whiteColor] delegate:self tableViewStyle:UITableViewStylePlain separatorStyle:UITableViewCellSeparatorStyleNone superview:maskView];
    _spreadView = spreadView;
//    spreadView.hidden = YES;
    [spreadView registerNib:[UINib nibWithNibName:NSStringFromClass([ATSubjectSpreadCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
    
    UIView *bgView = [[UIView alloc] initWithFrame:self.bounds];
    bgView.backgroundColor = [UIColor whiteColor];
    _bgView = bgView;
    [self addSubview:bgView];
    
    CGFloat btnWidth = 80;
    CGFloat btnHeight = 30;
    CGFloat margin = (ATScreenWidth - btnWidth * 3)/4.0;
    CGFloat topMargin = 10;

    ATSubjectSelectBtn *subjectBtn = [ATSubjectSelectBtn buttonWithFrame:CGRectMake(margin, topMargin, btnWidth, btnHeight) backgroundColor:nil title:@"数学" titleColor:nil titleFont:14 target:self action:@selector(btnClick:) superview:bgView];
    ATSubjectSelectBtn *gradeBtn = [ATSubjectSelectBtn buttonWithFrame:CGRectMake(subjectBtn.right + margin, topMargin, btnWidth, btnHeight) backgroundColor:nil title:@"高一" titleColor:nil titleFont:14 target:self action:@selector(btnClick:) superview:bgView];
    ATSubjectSelectBtn *categoryBtn = [ATSubjectSelectBtn buttonWithFrame:CGRectMake(gradeBtn.right + margin, topMargin, btnWidth, btnHeight) backgroundColor:nil title:@"分类" titleColor:nil titleFont:14 target:self action:@selector(btnClick:) superview:bgView];
        
    
}

- (void)btnClick:(UIButton *)btn {
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATSubjectSpreadCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    return cell;
}
 

@end
