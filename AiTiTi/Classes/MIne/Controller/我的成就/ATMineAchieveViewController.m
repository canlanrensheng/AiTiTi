//
//  ATMineAchieveViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/16.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMineAchieveViewController.h"

@interface ATMineAchieveViewController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView * collectionView;
@property (nonatomic,strong) NSArray * messagesArr;
@property (nonatomic,strong) NSArray * imagesArr;

@end

@implementation ATMineAchieveViewController

-(NSArray *)messagesArr{
    if (_messagesArr == nil) {
        _messagesArr = @[@[RGB(88, 179, 249),@"2/30",@"连续签到30天"],
                         @[RGB(92, 200, 149),@"2/2",@"累计购买2次VIP"],
                         @[RGB(239, 146, 56),@"5/100",@"累计观看100个视频"],
                         @[RGB(126, 113, 239),@"2/30",@"累计写30条大于15字评论"],
                         @[RGB(220, 112, 76),@"4/10",@"累计解锁10次"],
                         @[RGB(38, 95, 162),@"2/5",@"累计5次完成K.O计划"],
                         @[RGB(168, 157, 223),@"9/10",@"累计邀请10个同学"],
                         @[RGB(224, 80, 227),@"7/10",@"累计获得10次五星好评"]];
    }
    return _messagesArr;
}
-(NSArray *)imagesArr{
    if (_imagesArr == nil) {
        _imagesArr = @[@[@"achieve_1",@"achieve_on_1"],
                       @[@"achieve_2",@"achieve_on_2"],
                       @[@"achieve_3",@"achieve_on_3"],
                       @[@"achieve_4",@"achieve_on_4"],
                       @[@"achieve_5",@"achieve_on_5"],
                       @[@"achieve_6",@"achieve_on_6"],
                       @[@"achieve_7",@"achieve_on_7"],
                       @[@"achieve_8",@"achieve_on_8"]];
    }
    return _imagesArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"卡牌成就";
    self.view.backgroundColor = RGB(244, 244, 244);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI
-(void)makeSubViews{
    UIImage * img = IMAGE(@"achieve_1");
    UICollectionViewFlowLayout * flowLayout = [UICollectionViewFlowLayout new];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumLineSpacing = 30;
    flowLayout.minimumInteritemSpacing = 30;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 20, 20, 10);
    flowLayout.itemSize = CGSizeMake((ATScreenWidth-40)/2-15, ((ATScreenWidth-40)/2-15)*(img.size.height/img.size.width)+60);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = RGB(244, 244, 244);
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"Achieve"];
}

#pragma mark - collectionViewDelegate
//cell number
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 8;
}
//cell view
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Achieve" forIndexPath:indexPath];
    [cell.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    cell.backgroundColor = ATWhite;
    UIImageView * imageView = [UIImageView new];
    NSString * pro = self.messagesArr[indexPath.row][1];
    if ([pro integerValue]) {
        imageView.image = IMAGE(self.imagesArr[indexPath.row][1]);
    }else{
        imageView.image = IMAGE(self.imagesArr[indexPath.row][0]);
    }
    
    [cell addSubview:imageView];
    
    [imageView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(20, 20, 20, 20) excludingEdge:ALEdgeBottom];
    
    UIView * view = [UIView new];
    view.backgroundColor = self.messagesArr[indexPath.row][0];
    [cell addSubview:view];
    
    [view autoSetDimension:ALDimensionHeight toSize:60];
    [view autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    [view autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:imageView withOffset:20];
    
    UILabel * label1 = [UILabel new];
    label1.text = self.messagesArr[indexPath.row][1];
    label1.textColor = ATWhite;
    label1.font = kFONT13;
    [view addSubview:label1];
    
    [label1 autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [label1 autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    
    UILabel * label2 = [UILabel new];
    label2.text = self.messagesArr[indexPath.row][2];
    label2.textColor = ATWhite;
    label2.font = kFONT13;
    [view addSubview:label2];
    
    [label2 autoAlignAxisToSuperviewAxis:ALAxisVertical];
    [label2 autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label1 withOffset:10];
    
    cell.cornerRadius = 10;
    
    return cell;
}

@end
