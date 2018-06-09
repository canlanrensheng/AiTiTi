//
//  ATRankViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/2.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATRankViewController.h"
#import "ATRankMineView.h"
#import "ATRankListCell.h"
#import "ATSubjectListCell.h"

@interface ATRankViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)UITableView * leftSubtableView;
@property(nonatomic,strong)UITableView * rightSubtableView;

@end

@implementation ATRankViewController

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
    
    [topView autoSetDimension:ALDimensionHeight toSize:40];
    [topView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(statusbarH, 0, 0, 0) excludingEdge:ALEdgeBottom];
    
    UIButton * backButton = [UIButton buttonWithTitle:@"" titleColor:[UIColor whiteColor] font:kFONT13 target:self action:@selector(backAction) backImageName:@"return"];
    [topView addSubview:backButton];
    
    [backButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [backButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIView * titleView = [UIView new];
    titleView.borderColor = [UIColor grayColor];
    titleView.borderWidth = 0.5;
    titleView.cornerRadius = 15;
    [topView addSubview:titleView];
    
    [titleView autoSetDimensionsToSize:CGSizeMake(200, 30)];
    [titleView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [titleView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    UIButton * titleButton1 = [UIButton buttonWithTitle:@"学霸榜" titleColor:ATWhite font:kFONT13 target:self action:@selector(titleButtonAction:)];
    [titleButton1 setBackgroundImage:[UIImage createImageWithColor:RGB(88, 179, 249)] forState:UIControlStateSelected];
    [titleButton1 setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [titleButton1 setTitleColor:ATWhite forState:UIControlStateSelected];
    [titleButton1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    titleButton1.tag = 100 + 1;
    titleButton1.clipsToBounds = YES;
    [titleButton1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventAllTouchEvents];
    [titleView addSubview:titleButton1];
    
    [titleButton1 autoSetDimensionsToSize:CGSizeMake(100, 30)];
    [titleButton1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [titleButton1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    
    UIButton * titleButton2 = [UIButton buttonWithTitle:@"学科榜" titleColor:ATWhite font:kFONT13 target:self action:@selector(titleButtonAction:)];
    [titleButton2 setBackgroundImage:[UIImage createImageWithColor:RGB(88, 179, 249)] forState:UIControlStateSelected];
    [titleButton2 setBackgroundImage:[UIImage createImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
    [titleButton2 setTitleColor:ATWhite forState:UIControlStateSelected];
    [titleButton2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    titleButton2.tag = 100 + 2;
    titleButton2.clipsToBounds = YES;
    [titleButton2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventAllTouchEvents];
    [titleView addSubview:titleButton2];
    
    [titleButton2 autoSetDimensionsToSize:CGSizeMake(100, 30)];
    [titleButton2 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [titleButton2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    
    titleButton1.selected = YES;
    
    UIButton * shareButton = [UIButton buttonWithTitle:@"" titleColor:[UIColor whiteColor] font:kFONT13 target:self action:@selector(backAction) backImageName:@"quota_share"];
    [topView addSubview:shareButton];
    
    [shareButton autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [shareButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIView * leftView = [UIView new];
    leftView.tag = 1000;
    [self.view addSubview:leftView];
    
    [leftView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [leftView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView];
    
    UIImageView * bannerImg = [UIImageView new];
    bannerImg.image = IMAGE(@"rank_banner");
    [leftView addSubview:bannerImg];
    
    [bannerImg autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [bannerImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [bannerImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    
    ATRankMineView * mineView = [ATRankMineView new];
    mineView.autoresizingMask = 50;
    mineView.borderColor = [UIColor grayColor];
    mineView.borderWidth = 0.5;
    mineView.cornerRadius = 10;
    [leftView addSubview:mineView];
    
    [mineView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:bannerImg withOffset:10];
    [mineView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [mineView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 50;
    self.tableView.tag = 300;
    [leftView addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.tableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:mineView withOffset:10];
//    **********************************************************************************************************
    UIView * rightView = [UIView new];
    rightView.tag = 1001;
    rightView.alpha = 0;
    [self.view addSubview:rightView];
    
    [rightView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [rightView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView];
    
    UIImageView * bannerImgR = [UIImageView new];
    bannerImgR.image = IMAGE(@"rankSub_banner");
    [rightView addSubview:bannerImgR];
    
    [bannerImgR autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [bannerImgR autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:10];
    [bannerImgR autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    
    UIView * selectView = [UIView new];
    [rightView addSubview:selectView];
    
    [selectView autoSetDimension:ALDimensionHeight toSize:50];
    [selectView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:bannerImgR withOffset:10];
    [selectView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [selectView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    
    UIButton * selectButton1 = [UIButton buttonWithTitle:@"真题" titleColor:[UIColor blackColor] font:kFONT15 target:self action:@selector(selectAction:)];
    selectButton1.tag = 200;
    [selectButton1 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [selectButton1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [selectButton1 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventAllTouchEvents];
    selectButton1.selected = YES;
    [selectView addSubview:selectButton1];
    
    [selectButton1 autoSetDimensionsToSize:CGSizeMake(ATScreenWidth/2, 50)];
    [selectButton1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [selectButton1 autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    
    UIButton * selectButton2 = [UIButton buttonWithTitle:@"专题" titleColor:[UIColor blackColor] font:kFONT15 target:self action:@selector(selectAction:)];
    selectButton2.tag = 201;
    [selectButton2 setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];
    [selectButton2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [selectButton2 addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside | UIControlEventAllTouchEvents];
    [selectView addSubview:selectButton2];
    
    [selectButton2 autoSetDimensionsToSize:CGSizeMake(ATScreenWidth/2, 50)];
    [selectButton2 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:0];
    [selectButton2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:0];
    
    UIView * currView = [UIView new];
    currView.backgroundColor = RGB(88, 178, 248);
    currView.tag = 202;
    [selectView addSubview:currView];
    
    [currView autoSetDimensionsToSize:CGSizeMake(ATScreenWidth/2, 3)];
    [currView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:0];
    [currView autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:0];
    
    UIView * selectSubView = [UIView new];
    selectSubView.cornerRadius = 10;
    selectSubView.borderColor = [UIColor blackColor];
    selectSubView.borderWidth = 0.5;
    [rightView addSubview:selectSubView];
    
    [selectSubView autoSetDimensionsToSize:CGSizeMake(70, 20)];
    [selectSubView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:selectView withOffset:10];
    [selectSubView autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:10];
    
    UILabel * subjectLabel = [UILabel new];
    subjectLabel.text = @"数学";
    subjectLabel.font = kFONT14;
    [selectSubView addSubview:subjectLabel];
    
    [subjectLabel autoCenterInSuperview];
    
    UIImageView * selectImg = [UIImageView new];
    selectImg.image = IMAGE(@"select_img");
//    __weak typeof(selectImg)WeakImg = selectImg;
//    [selectImg addJXTouch:^{
//        CGAffineTransform transform= CGAffineTransformMakeRotation(M_PI);
//        WeakImg.transform = transform;
//    }];
    [selectSubView addSubview:selectImg];
    
    [selectImg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:subjectLabel withOffset:5];
    [selectImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:subjectLabel];
    
    self.leftSubtableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.leftSubtableView.delegate = self;
    self.leftSubtableView.dataSource = self;
    self.leftSubtableView.estimatedRowHeight = 50;
    self.leftSubtableView.tag = 301;
    [rightView addSubview:self.leftSubtableView];
    
    [self.leftSubtableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.leftSubtableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:selectSubView withOffset:10];
    
    self.rightSubtableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.rightSubtableView.delegate = self;
    self.rightSubtableView.dataSource = self;
    self.rightSubtableView.estimatedRowHeight = 50;
    self.rightSubtableView.alpha = 0;
    self.rightSubtableView.tag = 302;
    [rightView addSubview:self.rightSubtableView];
    
    [self.rightSubtableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [self.rightSubtableView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:selectSubView withOffset:10];
}

#pragma mark - tableViewDalegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == 300) {
        return 10;
    }else if (tableView.tag == 301){
        return 10;
    }else if (tableView.tag == 302){
        return 10;
    }else{
        return 0;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == 300) {
        ATRankListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"rank"];
        if (cell == nil) {
            cell = [[ATRankListCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"rank"];
        }
        if (indexPath.row > 2) {
            cell.NoImg.hidden = YES;
            cell.NoLabel.hidden = NO;
            cell.NoLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row + 1];
        }else{
            cell.NoImg.hidden = NO;
            cell.NoLabel.hidden = YES;
            if (indexPath.row == 0){
                cell.NoImg.image = IMAGE(@"rank_No1");
            }else if (indexPath.row == 1){
                cell.NoImg.image = IMAGE(@"rank_No2");
            }else if (indexPath.row == 2){
                cell.NoImg.image = IMAGE(@"rank_No3");
            }
        }
        return cell;
    }else{
        ATSubjectListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"subject"];
        if (cell == nil) {
            cell = [[ATSubjectListCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"subject"];
        }
        cell.numLabel.text = [NSString stringWithFormat:@"%02ld",indexPath.row + 1];
        return cell;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Action
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)btnClick:(UIButton *)btn{
    btn.highlighted = NO;
}
-(void)titleButtonAction:(UIButton *)btn{
    if (btn.selected) {
        return;
    }
    UIView *view = [UIView new];
    UIView *otherview = [UIView new];
    if (btn.tag == 101) {
        UIButton * button = (UIButton *)[self.view viewWithTag:102];
        button.selected = NO;
        
        view = (UIView *)[self.view viewWithTag:1000];
        otherview = (UIView *)[self.view viewWithTag:1001];
        
    }else if (btn.tag == 102){
        UIButton * button = (UIButton *)[self.view viewWithTag:101];
        button.selected = NO;
        
        view = (UIView *)[self.view viewWithTag:1001];
        otherview = (UIView *)[self.view viewWithTag:1000];
    }
    [UIView animateWithDuration:0.5 animations:^{
        view.alpha = 1.0;
        otherview.alpha = 0.0;
    }];
    btn.selected = YES;
}
-(void)selectAction:(UIButton *)btn{
    if (btn.selected) {
        return;
    }
    UIView * currView = [self.view viewWithTag:202];
    if (btn.tag == 200) {
        UIButton * button = (UIButton *)[self.view viewWithTag:201];
        button.selected = NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            currView.frame = CGRectMake(0, 47, btn.width, 3);
            self.leftSubtableView.alpha = 1;
            self.rightSubtableView.alpha = 0;
        }];
    }else if (btn.tag == 201){
        UIButton * button = (UIButton *)[self.view viewWithTag:200];
        button.selected = NO;
        
        [UIView animateWithDuration:0.5 animations:^{
            currView.frame = CGRectMake(ATScreenWidth/2, 47, btn.width, 3);
            self.leftSubtableView.alpha = 0;
            self.rightSubtableView.alpha = 1;
        }];
    }
    btn.selected = YES;
}

@end
