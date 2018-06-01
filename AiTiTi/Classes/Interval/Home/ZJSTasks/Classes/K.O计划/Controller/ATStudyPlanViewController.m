//
//  ATStudyPlanViewController.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATStudyPlanViewController.h"
#import "ATStudyPlanListCell.h"
#import "ATStudentRecommondCell.h"
#import "ATStudyHeaderView.h"
#import "ATStudyPlanReusableView.h"
#import "ATStudyPlanSectionFooterView.h"
#import "ATPlanDetailViewController.h"
#define HeaderViewHeight 254
@interface ATStudyPlanViewController()

@property (nonatomic,strong) ATStudyHeaderView *headerView;

@end

@implementation ATStudyPlanViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (ATStudyHeaderView *)headerView{
    if(!_headerView){
        _headerView = [[[NSBundle mainBundle] loadNibNamed:@"ATStudyHeaderView" owner:self options:nil] lastObject];
    }
    return _headerView;
}

- (void)tx_configSubViews{
    self.title = @"学习计划";
    
//      self.shopHeaderView = [[BrandShopHeaderView alloc] initWithFrame:CGRectMake(0, -MCHHEIGHT, SWIDTH, MCHHEIGHT) WithAdData:self.adMarr];
    self.headerView.frame = CGRectMake(0, -HeaderViewHeight, Screen_Width, HeaderViewHeight);
    [self.collectionView addSubview:self.headerView];
    [self.collectionView setFrame: CGRectMake(0, 13, Screen_Width - 26, Screen_Height - kNavigationBarHeight)];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ATStudyPlanListCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ATStudyPlanListCell"];
     [self.collectionView registerNib:[UINib nibWithNibName:@"ATStudentRecommondCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ATStudentRecommondCell"];
    
    
    [self.collectionView registerNibHeaderFooter:[ATStudyPlanReusableView class]];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ATStudyPlanReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"ATStudyPlanReusableView"];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ATStudyPlanSectionFooterView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"ATStudyPlanSectionFooterView"];
    
    
    self.collectionView.contentInset = UIEdgeInsetsMake(HeaderViewHeight, 0, 0, 0);
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 13, 0, 13));
    }];
}

- (void)tx_loadData{
   
}

- (void)tx_bindViewModel{
//    self.viewModel.titleViewType = BMTitleViewTypeLoadingTitle;
//    [self.viewModel.JMBrandCommomd execute:nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
//    return self.viewModel.JMBrandArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        ATStudyPlanListCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ATStudyPlanListCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }else{
        ATStudentRecommondCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ATStudentRecommondCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    ATPlanDetailViewController *planVC = [[ATPlanDetailViewController alloc] init];
    [self.navigationController pushViewController:planVC animated:YES];
}

//设置每个cell的大小 Item网格
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.collectionView.bounds.size.width - 10) / 2.0f;
    return CGSizeMake(width, 228);
}

//设置cell上下左右侧距离
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    return UIEdgeInsetsMake(0, 0, 0, 0);
//}

#pragma mark CollectionViewSectionHeaderDelagate
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath{
    static NSString *footerIdentifier = @"ATStudyPlanSectionFooterView";
    static NSString *headerIdentifier = @"ATStudyPlanReusableView";
    NSString *reuseIdentifier;
    if ([kind isEqualToString: UICollectionElementKindSectionFooter ]){
        reuseIdentifier = footerIdentifier;
    }else{
        reuseIdentifier = headerIdentifier;
    }
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
        ATStudyPlanReusableView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
        return view;
    }else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
        ATStudyPlanSectionFooterView *view =  [collectionView dequeueReusableSupplementaryViewOfKind :kind   withReuseIdentifier:reuseIdentifier   forIndexPath:indexPath];
        return view;
    }
    return nil;
}

//Collection 区头的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(0, 70);
}

//UICollectionView设置区尾的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    //设置区尾 高度
    CGSize size = CGSizeMake(Screen_Width - 26, 106);
    return size;
}

@end

