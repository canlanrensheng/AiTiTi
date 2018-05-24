//
//  ATIntervalViewController.m
//  AiTiTi
//
//  Created by 童城 on 2018/4/23.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATIntervalViewController.h"
#import "ATIntervalHeaderView.h"
#import "ATIntervalExamViewController.h"
#import "ATQuotaViewController.h"
#import "ATRankViewController.h"

@interface ATIntervalViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)ATIntervalHeaderView * headerView;
@property(nonatomic,strong)NSMutableArray * itemArray;
@property(nonatomic,strong)NSMutableArray * bannerArray;

@end

@implementation ATIntervalViewController

-(NSMutableArray *)itemArray{
    if (_itemArray == nil) {
        _itemArray = [[NSMutableArray alloc] initWithArray:@[@"interval_rank",@"interval_univer",@"interval_exam",@"interval_quota",@"interval_compos",@"interval_ach",@"interval_subject"]];
    }
    return _itemArray;
}

-(NSMutableArray *)bannerArray{
    if (_bannerArray == nil) {
        _bannerArray = [NSMutableArray array];
    }
    return _bannerArray;
}

-(ATIntervalHeaderView *)headerView{
    if (_headerView == nil) {
        _headerView = [[ATIntervalHeaderView alloc] initWithFrame:CGRectZero];
        _headerView.bannerBlock = ^(NSInteger index) {
            //
        };
    }
    return _headerView;
}

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
    UICollectionViewFlowLayout * flowLayout = [UICollectionViewFlowLayout new];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 10;
    flowLayout.itemSize = CGSizeMake(ATKeyWindow.width/2, 60);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = ATWhite;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"interval"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
}

#pragma mark - collectionViewDelegate
//cell number
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.itemArray.count;
}
//cell view
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"interval" forIndexPath:indexPath];
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    UIImageView * imgView = [UIImageView new];
    imgView.image = IMAGE(self.itemArray[indexPath.row]);
    [cell addSubview:imgView];
    
    [imgView autoCenterInSuperview];
    
    return cell;
}
//cell select
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//学霸排行榜
        ATRankViewController * VC = [ATRankViewController new];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 1){
        //
    }else if (indexPath.row == 2){//高考倒计时
        ATIntervalExamViewController * VC = [ATIntervalExamViewController new];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 3){//励志语
        ATQuotaViewController * VC = [ATQuotaViewController new];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (indexPath.row == 4){
        //
    }else if (indexPath.row == 5){
        //
    }else if (indexPath.row == 6){
        //
    }
}
//add headerview
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView * header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
        [header addSubview:self.headerView];
        return header;
    }
    return nil;
}
//headerview size
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    UIImage * cycImg;
    if (self.bannerArray.count) {
        cycImg = [UIImage imageWithData:[NSData dataWithContentsOfURL:self.bannerArray[0]]];
    }else{
        cycImg = IMAGE(@"interval_cyc");
    }
    return CGSizeMake(ATScreenWidth, ATScreenWidth/(cycImg.size.width/cycImg.size.height) + 20);
}
@end
