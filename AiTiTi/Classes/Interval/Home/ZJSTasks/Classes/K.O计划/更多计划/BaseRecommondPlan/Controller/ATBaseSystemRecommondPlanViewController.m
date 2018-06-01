//
//  ATBaseRecommondPlanViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/31.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATBaseSystemRecommondPlanViewController.h"
#import "ATStudyPlanListCell.h"

@interface ATBaseSystemRecommondPlanViewController()


@end

@implementation ATBaseSystemRecommondPlanViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)tx_configSubViews{

    [self.collectionView setFrame: CGRectMake(0, 13, Screen_Width - 26, Screen_Height - kNavigationBarHeight - 40)];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ATStudyPlanListCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ATStudyPlanListCell"];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 13, kBottomBarHeight, 13));
    }];
}

- (void)tx_loadData{
    
}

- (void)tx_bindViewModel{
    //    self.viewModel.titleViewType = BMTitleViewTypeLoadingTitle;
    //    [self.viewModel.JMBrandCommomd execute:nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
    //    return self.viewModel.JMBrandArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ATStudyPlanListCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ATStudyPlanListCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    //    [cell setViewModel:self.viewModel indexPath:indexPath];

    cell.headerBackView.backgroundColor =
    RGBA(23,207,151,0.1);
    cell.classNameLabel.backgroundColor = RGB(23,207,151);
   
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
}

//设置每个cell的大小 Item网格
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.collectionView.bounds.size.width - 10) / 2.0f;
    return CGSizeMake(width, 228);
}


@end

