//
//  ATSearchViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/22.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSearchViewController.h"
#import <SKTagView.h>

@interface ATSearchViewController ()

@property(nonatomic,strong)SKTagView * tagView;
@property(nonatomic,strong)UISearchBar * searchBar;
@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation ATSearchViewController

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = ATWhite;
    [self makeSubViews];
    
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
    
    [topView autoSetDimension:ALDimensionHeight toSize:60];
    [topView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(statusbarH, 0, 0, 0) excludingEdge:ALEdgeBottom];
    
    UIButton * backButton = [UIButton buttonWithTitle:@"" titleColor:[UIColor whiteColor] font:kFONT13 target:self action:@selector(backAction) backImageName:@"return"];
    [topView addSubview:backButton];
    
    [backButton autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [backButton autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    
    UIView * searchBarBg = [UIView new];
    searchBarBg.backgroundColor = RGB(245, 245, 245);
    searchBarBg.cornerRadius = 20;
    [topView addSubview:searchBarBg];
    
    [searchBarBg autoSetDimension:ALDimensionHeight toSize:40];
    [searchBarBg autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:10];
    [searchBarBg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [searchBarBg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:backButton withOffset:10];
    
    self.searchBar = [UISearchBar new];
    self.searchBar.searchBarStyle = UISearchBarStyleMinimal;
    self.searchBar.placeholder = @"  输入你要搜索的内容";
    [searchBarBg addSubview:self.searchBar];

    UITextField *searchField = [self.searchBar valueForKey:@"_searchField"];
    searchField.borderStyle = UITextBorderStyleNone;
    searchField.font = kFONT15;

    [self.searchBar autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(0, 0, 0, 80)];

    UIButton * searchButton = [UIButton buttonWithTitle:@"发布" titleColor:ATWhite font:kFONT15 target:self action:@selector(searchAction)];
    [searchButton setBackgroundImage:[UIImage createImageWithColor:RGB(89, 179, 249)] forState:UIControlStateNormal];
    searchButton.clipsToBounds = YES;
    [searchBarBg addSubview:searchButton];

    [searchButton autoSetDimensionsToSize:CGSizeMake(80, 40)];
    [searchButton autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeLeft];
    
    UIImageView * hotImg = [UIImageView new];
    hotImg.image = IMAGE(@"hot");
    [self.view addSubview:hotImg];
    
    [hotImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [hotImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:topView withOffset:20];
    
    UILabel * label1 = [UILabel new];
    label1.text = @"热门搜索";
    label1.font = kFONT14;
    [self.view addSubview:label1];
    
    [label1 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:hotImg];
    [label1 autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:hotImg withOffset:5];
    
    UILabel * label2 = [UILabel new];
    [label2 addJXTouch:^{
        //
    }];
    label2.text = @"换一批";
    label2.font = kFONT14;
    label2.textColor = [UIColor grayColor];
    [self.view addSubview:label2];
    
    [label2 autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [label2 autoAlignAxis:ALAxisHorizontal toSameAxisOfView:label1];
    
    self.dataArray = [NSMutableArray arrayWithArray:@[@"诺克萨斯",@"皮尔特沃夫",@"祖安",@"比尔吉沃特",@"暗影岛",@"艾欧里亚",@"哈哈哈哈哈哈哈"]];
    
    self.tagView = [SKTagView new];
    self.tagView.preferredMaxLayoutWidth = ATScreenWidth - 40;
    self.tagView.padding = UIEdgeInsetsMake(12.f, 0.f, 12.f, 0.f);
    self.tagView.interitemSpacing = 10;
    self.tagView.lineSpacing = 10;
    [self.view addSubview:self.tagView];
    
    [self.tagView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:label1 withOffset:5];
    [self.tagView autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    
    [self.tagView removeAllTags];
    [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SKTag * tag = [SKTag tagWithText:obj];
        tag.textColor = [UIColor grayColor];
        tag.fontSize = 14.f;
        tag.padding = UIEdgeInsetsMake(5.f, 20.f, 5.f, 20.f);
        tag.bgColor = [UIColor clearColor];
        tag.borderColor = [UIColor grayColor];
        tag.borderWidth = 1.f;
        tag.cornerRadius = 15.f;
        [self.tagView addTag:tag];
    }];
    
    self.tagView.didTapTagAtIndex = ^(NSUInteger index) {
        NSLog(@"%ld",index);
    };
}

#pragma mark - tagView
-(void)makeTagView{
    self.tagView = [SKTagView new];
    [self.view addSubview:self.tagView];
    
    [self.tagView removeAllTags];
    [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SKTag * tag = [SKTag tagWithText:obj];
        [self.tagView addTag:tag];
    }];
    
    
}

#pragma mark - Action
-(void)backAction{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)searchAction{
    self.editing = NO;
    NSLog(@"%@",self.searchBar.text);
}
@end
