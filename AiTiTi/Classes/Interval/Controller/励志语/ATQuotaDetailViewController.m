//
//  ATQuotaDetailViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/27.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATQuotaDetailViewController.h"

@interface ATQuotaDetailViewController ()

@end

@implementation ATQuotaDetailViewController

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"励志语";
    
    UIBarButtonItem *classPage = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"quota_class"] style:UIBarButtonItemStyleDone target:self action:@selector(classAction)];
    self.navigationItem.rightBarButtonItem = classPage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
//    UIScrollView * scrollView = [UIScrollView new];
//    scrollView.bounces = NO;
//    scrollView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:scrollView];
//
//    [scrollView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    UIView * view = [UIView new];
    view.backgroundColor =ATWhite;
    view.borderWidth = 0.5;
    view.borderColor = [UIColor grayColor];
    view.cornerRadius = 10;
    [self.view addSubview:view];
    
    [view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10 + navigationH, 10, 10, 10)];
    
    UIButton * collButton = [UIButton buttonWithTitle:@"" titleColor:ATWhite font:kFONT10 target:self action:@selector(collButtonAction:)];
    [collButton setImage:IMAGE(@"quota_coll_off") forState:UIControlStateNormal];
    [collButton setImage:IMAGE(@"quota_coll_on") forState:UIControlStateSelected];
    [view addSubview:collButton];
    
    [collButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [collButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    
    UIButton * shareButton = [UIButton buttonWithTitle:@"" titleColor:ATWhite font:kFONT10 target:self action:@selector(shareButtonAction)];
    [shareButton setImage:IMAGE(@"quota_share") forState:UIControlStateNormal];
    [view addSubview:shareButton];
    
    [shareButton autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:20];
    [shareButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    UIImageView * imgView = [UIImageView new];
    imgView.image = IMAGE(@"quota_def");
    [view addSubview:imgView];
    
    [imgView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeTop];
    [imgView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:collButton withOffset:10];
}

#pragma mark - Action
-(void)collButtonAction:(UIButton *)btn{
    btn.selected = !btn.selected;
}
-(void)shareButtonAction{
    //
}
-(void)classAction{
    //
}
@end
