//
//  ATMineCENViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/22.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineCENViewController.h"
#import "ATCollectView.h"
#import "ATErrorView.h"
#import "ATNoteView.h"

@interface ATMineCENViewController ()

@property (nonatomic,strong) UILabel * subjectLabel;
@property (nonatomic,strong) UILabel * subjectLabel2;

@end

@implementation ATMineCENViewController

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
    UIView * topView = [UIView new];
    [self.view addSubview:topView];
    
    [topView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(statusbarH, 0, 0, 0) excludingEdge:ALEdgeBottom];
    [topView autoSetDimension:ALDimensionHeight toSize:40];
    
    UIButton * backButton = [UIButton buttonWithTitle:@"" titleColor:[UIColor whiteColor] font:kFONT13 target:self action:@selector(backAction) backImageName:@"return"];
    [topView addSubview:backButton];
    
    [backButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [backButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIButton * errorBtn = [UIButton buttonWithTitle:@"错题" titleColor:ATGray font:kFONT17 target:self action:@selector(topBtnActoin:)];
    [errorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [errorBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventAllTouchEvents];
    errorBtn.tag = 101;
    [topView addSubview:errorBtn];
    
    [errorBtn autoCenterInSuperview];
    
    UIButton * collectBtn = [UIButton buttonWithTitle:@"收藏" titleColor:ATGray font:kFONT17 target:self action:@selector(topBtnActoin:)];
    [collectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [collectBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventAllTouchEvents];
    collectBtn.tag = 100;
    collectBtn.selected = YES;
    [topView addSubview:collectBtn];
    
    [collectBtn autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [collectBtn autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:errorBtn withOffset:-20];
    
    UIButton * noteBtn = [UIButton buttonWithTitle:@"笔记" titleColor:ATGray font:kFONT17 target:self action:@selector(topBtnActoin:)];
    [noteBtn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [noteBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventAllTouchEvents];
    noteBtn.tag = 102;
    [topView addSubview:noteBtn];
    
    [noteBtn autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [noteBtn autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:errorBtn withOffset:20];
    
    UIView * line = [UIView new];;
    line.backgroundColor = ATBlue;
    line.tag = 200;
    [topView addSubview:line];
    
    [line autoMatchDimension:ALDimensionWidth toDimension:ALDimensionWidth ofView:collectBtn];
    [line autoSetDimension:ALDimensionHeight toSize:3];
    [line autoAlignAxis:ALAxisVertical toSameAxisOfView:collectBtn];
    [line autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    
    UIView * selectSubView = [UIView new];
    selectSubView.cornerRadius = 12.5;
    selectSubView.borderColor = [UIColor blackColor];
    selectSubView.borderWidth = 0.5;
    [self.view addSubview:selectSubView];
    
    [selectSubView autoSetDimensionsToSize:CGSizeMake(70, 25)];
    [selectSubView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:20];
    [selectSubView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    UIImageView * selectImg = [UIImageView new];
    selectImg.image = IMAGE(@"select_img");
    [selectSubView addSubview:selectImg];
    
    [selectImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [selectImg autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.subjectLabel = [UILabel new];
    self.subjectLabel.text = @"类型";
    self.subjectLabel.font = kFONT14;
    [selectSubView addSubview:self.subjectLabel];
    
    [self.subjectLabel autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.subjectLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:selectImg withOffset:-5];
    
    UIView * selectSubView2 = [UIView new];
    selectSubView2.cornerRadius = 12.5;
    selectSubView2.borderColor = [UIColor blackColor];
    selectSubView2.borderWidth = 0.5;
    [self.view addSubview:selectSubView2];
    
    [selectSubView2 autoSetDimensionsToSize:CGSizeMake(70, 25)];
    [selectSubView2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:20];
    [selectSubView2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:selectSubView withOffset:-20];
    
    UIImageView * selectImg2 = [UIImageView new];
    selectImg2.image = IMAGE(@"select_img");
    [selectSubView2 addSubview:selectImg2];
    
    [selectImg2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    [selectImg2 autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    self.subjectLabel2 = [UILabel new];
    self.subjectLabel2.text = @"科目";
    self.subjectLabel2.font = kFONT14;
    [selectSubView2 addSubview:self.subjectLabel2];
    
    [self.subjectLabel2 autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [self.subjectLabel2 autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:selectImg2 withOffset:-5];
    
    ATCollectView * firstView = [ATCollectView new];
    firstView.tag = 300;
    [self.view addSubview:firstView];
    
    [firstView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [firstView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:selectSubView withOffset:20];
    
    ATErrorView * secondView = [ATErrorView new];
    secondView.tag = 301;
    secondView.alpha = 0;
    [self.view addSubview:secondView];
    
    [secondView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [secondView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:selectSubView withOffset:20];
    
    ATNoteView * thirdView = [ATNoteView new];
    thirdView.tag = 302;
    thirdView.alpha = 0;
    [self.view addSubview:thirdView];
    
    [thirdView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [thirdView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:selectSubView withOffset:20];
}

#pragma mark - Action
-(void)topBtnActoin:(UIButton *)btn{
    if (!btn.isSelected) {
        UIView * line = [self.view viewWithTag:200];
        [UIView animateWithDuration:0.5 animations:^{
            CGRect frame = btn.frame;
            line.frame = CGRectMake(frame.origin.x, 40 - 3, frame.size.width, 3);
        }];
        
        UIButton * firstBtn = (UIButton *)[self.view viewWithTag:100];
        UIButton * secondBtn = (UIButton *)[self.view viewWithTag:101];
        UIButton * thirdBtn = (UIButton *)[self.view viewWithTag:102];
        
        UIView * showView = [UIView new];
        UIView * hiddenView = [UIView new];
        UIView * hiddenView2 = [UIView new];
        
        if (btn.tag == 100) {
            secondBtn.selected = NO;
            thirdBtn.selected = NO;
            
            showView = [self.view viewWithTag:300];
            hiddenView = [self.view viewWithTag:301];
            hiddenView2 = [self.view viewWithTag:302];
        }else if (btn.tag == 101){
            firstBtn.selected = NO;
            thirdBtn.selected = NO;
            
            showView = [self.view viewWithTag:301];
            hiddenView = [self.view viewWithTag:300];
            hiddenView2 = [self.view viewWithTag:302];
        }else if (btn.tag == 102){
            firstBtn.selected = NO;
            secondBtn.selected = NO;
            
            showView = [self.view viewWithTag:302];
            hiddenView = [self.view viewWithTag:301];
            hiddenView2 = [self.view viewWithTag:300];
        }
        btn.selected = YES;
        
        [UIView animateWithDuration:0.5 animations:^{
            showView.alpha = 1;
            hiddenView.alpha = 0;
            hiddenView2.alpha = 0;
        }];
    }
}
-(void)btnClick:(UIButton *)btn{
    btn.highlighted = NO;
}
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
