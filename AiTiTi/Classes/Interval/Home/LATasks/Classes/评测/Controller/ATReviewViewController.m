//
//  ATReviewViewController.m
//  AiTiTi
//
//  Created by LA on 2018/6/5.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATReviewViewController.h"
#import "ATEvaluationBottomTool.h"
#import "ATUnitTestingViewController.h"

@interface ATReviewViewController ()

@property (nonatomic, strong)ATEvaluationBottomTool *bottomTool;

@end

@implementation ATReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews {
    self.navigationItem.title = @"测评";
    
    [self setupUI];
}

- (void)setupUI {
    UILabel *desLabel = [UILabel creatLabel:^(UILabel *label) {
        label.ljTitle_font_textColor(@"10分钟了解你对高考掌握情况",HB18,RGB(51, 51, 51));
        label.ljAligment(NSTextAlignmentCenter);
        [label sizeToFit];
    }];
    [self.view addSubview:desLabel];
    [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(25);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    UIView *tagBgView = [[UIView alloc] init];
    ViewBorderRadius(tagBgView, 5.0f, 0.8, RGB(237, 238, 239));
    [self.view addSubview:tagBgView];
    [tagBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(-12);
        make.top.equalTo(desLabel.mas_bottom).offset(68/2);
    }];
    
    UILabel *titleLabel = [UILabel creatLabel:^(UILabel *label) {
        label.ljTitle_font_textColor(@"科目选择",H15,RGB(51, 51, 51));
        label.ljAligment(NSTextAlignmentCenter);
        [label sizeToFit];
    }];
    [tagBgView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tagBgView.mas_top).offset(48/2);
        make.centerX.equalTo(tagBgView.mas_centerX);
    }];
    
    SKTagView *tagView = [[SKTagView alloc] init];
    NSArray *tagArr = @[@"数学",@"语文",@"英语",@"化学",@"物理"];
    // 整个tagView对应其SuperView的上左下右距离
    CGFloat spaceW = ((Screen_Width - 24) - 150 *2 ) / 3;
    tagView.padding = UIEdgeInsetsMake(10, spaceW, 10, spaceW);
    // 上下行之间的距离
    tagView.lineSpacing = 35/2;
    // item之间的距离
    tagView.interitemSpacing = spaceW;
    // 最大宽度
    tagView.preferredMaxLayoutWidth = (Screen_Width - 24);
    tagView.regularWidth = 150;
    tagView.regularHeight = 44;
    tagView.tagViewStyle = SKTagViewStyleOnlySelectOne;
    // 开始加载
    [tagArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 初始化标签
        SKTag *tag = [[SKTag alloc] initWithText:tagArr[idx]];
        // 标签相对于自己容器的上左下右的距离
        tag.padding = UIEdgeInsetsMake(3, 15, 3, 15);
        // 弧度
        tag.cornerRadius = 22.0f;
        // 字体
        tag.font = [UIFont boldSystemFontOfSize:12];
        // 边框宽度
        tag.borderWidth = 1;
        // 背景
        tag.bgColor = [UIColor whiteColor];
        // 边框颜色
        tag.borderColor = RGB(231, 231, 231);
        // 字体颜色
        tag.textColor = [UIColor colorWithRed:53/255.0 green:53/255.0 blue:53/255.0 alpha:1];
        // 是否可点击
        tag.enable = YES;
        //
        tag.selectTextColor = [UIColor whiteColor];
        tag.selectBgColor = RGB(45, 180, 255);
        tag.selectborderColor = [UIColor clearColor];
        
        // 加入到tagView
        [tagView addTag:tag];
    }];
    
    [tagBgView addSubview:tagView];
    [tagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(48/2);
        make.left.right.equalTo(tagBgView);
        make.bottom.equalTo(tagBgView.mas_bottom).offset(-95/2);
    }];
    
    tagView.didTapTagAtIndex = ^(NSUInteger index) {
        ATLog(@"%ld",index);
    };
    
    [self.view addSubview:self.bottomTool];
    [self.bottomTool mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.width.equalTo(self.view);
        make.height.mas_equalTo(kBottomBarHeight);
    }];
    
}


- (void)tx_loadData {
    
}

- (void)tx_bindViewModel {
    
}

- (ATEvaluationBottomTool *)bottomTool {
    if (!_bottomTool) {
        _bottomTool = [ATEvaluationBottomTool viewFromXib];
        @weakify(self);
        _bottomTool.collegeExaminationBtnBlock = ^{
            
        };
        _bottomTool.unitTestingBtnBlock = ^{
            @strongify(self);
            ATUnitTestingViewController *unitVC = [[ATUnitTestingViewController alloc] initWithParams:nil];
            [self.navigationController pushViewController:unitVC animated:YES];
        };
    }
    return _bottomTool;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

