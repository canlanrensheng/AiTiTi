//
//  ATBaseStudentRecommondPlanViewController.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/6/1.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATBaseStudentRecommondPlanViewController.h"
#import "ATStudentRecommondCell.h"

@interface ATBaseStudentRecommondPlanViewController()



@end

@implementation ATBaseStudentRecommondPlanViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


- (void)tx_configSubViews{
    self.view.backgroundColor = white_color;
    [self.collectionView setFrame: CGRectMake(0, 13, Screen_Width - 26, Screen_Height - kNavigationBarHeight - 40)];
    [self.collectionView registerNib:[UINib nibWithNibName:@"ATStudentRecommondCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ATStudentRecommondCell"];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 13, kBottomBarHeight + 20, 13));
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
    ATStudentRecommondCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ATStudentRecommondCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
}

//设置每个cell的大小 Item网格
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.collectionView.bounds.size.width - 10) / 2.0f;
    return CGSizeMake(width, 251);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(18, 0, 0, 0);
}


@end

