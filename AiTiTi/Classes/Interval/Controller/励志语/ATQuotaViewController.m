//
//  ATQuotaViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/27.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATQuotaViewController.h"
#import "ATQuotaDetailViewController.h"

@interface ATQuotaViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView * collectionView;

@end

@implementation ATQuotaViewController

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
//    topView.backgroundColor = [UIColor redColor];
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

    UIButton * titleButton1 = [UIButton buttonWithTitle:@"往期所有" titleColor:ATWhite font:kFONT13 target:self action:@selector(titleButtonAction:)];
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

    UIButton * titleButton2 = [UIButton buttonWithTitle:@"我的收藏" titleColor:ATWhite font:kFONT13 target:self action:@selector(titleButtonAction:)];
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
    
    UICollectionViewFlowLayout * flowLayout = [UICollectionViewFlowLayout new];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.estimatedItemSize = CGSizeMake((ATScreenWidth-10)/3, 100);
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 10;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = ATWhite;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"quota"];
    
    [self.collectionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 5, 0, 5) excludingEdge:ALEdgeTop];
    [self.collectionView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:10];
}

#pragma mark - collectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 33;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"quota" forIndexPath:indexPath];
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIImageView * imgView = [UIImageView new];
    imgView.image = IMAGE(@"quota_def");
    [cell addSubview:imgView];
    
    [imgView autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [imgView autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    UILabel * titleLabel = [UILabel new];
    titleLabel.text = [NSString stringWithFormat:@"%02ld期",indexPath.row+1];
    [cell addSubview:titleLabel];
    
    [titleLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:imgView withOffset:5];
    [titleLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [titleLabel autoPinEdgeToSuperviewEdge:ALEdgeBottom withInset:5];
    
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ATQuotaDetailViewController * VC = [ATQuotaDetailViewController new];
    [self.navigationController pushViewController:VC animated:YES];
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
    if (btn.tag == 101) {
        UIButton * button = (UIButton *)[self.view viewWithTag:102];
        button.selected = NO;
    }else if (btn.tag == 102){
        UIButton * button = (UIButton *)[self.view viewWithTag:101];
        button.selected = NO;
    }
    btn.selected = YES;
}
@end
