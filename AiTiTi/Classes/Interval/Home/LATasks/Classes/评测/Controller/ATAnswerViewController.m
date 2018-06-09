//
//  ATAnswerViewController.m
//  AiTiTi
//
//  Created by LA on 2018/6/7.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATAnswerViewController.h"
#import "ATAnswerBtnBottomTool.h"
#import "ATAnswerModel.h"
#import "ATMaterialView.h"

@interface ATAnswerViewController ()
@property (nonatomic, strong) ATAnswerBtnBottomTool *bottomTool;
@property (nonatomic, strong) NSMutableArray *questionsArray;
@property (nonatomic, strong) ATAnswerModel *model;
@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, weak) UILabel *questionlabel;
@property (nonatomic, strong) UIImageView *showImageV;
@property (nonatomic, strong) ATMaterialView *materialView;

@property (nonatomic, assign) BOOL isCreatControl;
@property (nonatomic, assign) NSInteger page;


@end

@implementation ATAnswerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)tx_configSubViews {
    // 初始化页码
    _page = 0;
    
    // 模拟题目数据（服务端数据库）
    [self setQuestionsArray];
    
    // 获取题目信息，每次获取当前目标题目信息
    [self getQuestionsInfo];
    
    [self.view addSubview:self.bottomTool];
    [self.bottomTool mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(kBottomBarHeight);
    }];
    
}


- (void)tx_loadData {
    
    
}

//模拟题目数据（服务端数据库）
- (void)setQuestionsArray
{
    NSArray *array = @[
                       @{
                           @"questionid" : @"1000",
                           @"totalCount" : @"5",
                           @"question" : @"2017全国1卷英语第7题【单选题】",
                           @"imageUrl":@"test_hanshu_bg",
                           @"isEnglish":@"0"
                           },
                       @{
                           @"questionid" : @"1001",
                           @"totalCount" : @"5",
                           @"question" : @"2018全国1卷数学第7题【单选题】",
                           @"imageUrl":@"test_English_bg",
                           @"isEnglish":@"1"
                           },
                       @{
                           @"questionid" : @"1002",
                           @"totalCount" : @"5",
                           @"question" : @"2019小明被老师赶出来后决定进入",
                           @"imageUrl":@"test_more_select_bg",
                           @"isEnglish":@"0"
                           },
                       @{
                           @"questionid" : @"1003",
                           @"totalCount" : @"5",
                           @"question" : @"2020全国1卷数学第7题【单选题",
                           @"imageUrl":@"test_voice_bg",
                           @"isEnglish":@"0"
                           }
                       ];
    
    self.questionsArray = [ATAnswerModel mj_objectArrayWithKeyValuesArray:array];
}

// 获取题目信息，每次获取当前目标题目信息
- (void)getQuestionsInfo {
    
    // 更新模型
    _model = _questionsArray[_page];
    NSLog(@"输出当前页数 = %ld",_page);
    
    // 创建控件
    if (!_isCreatControl) [self setupControl];
    
    //刷新视图
    [self reloadView];
}


- (void)setupControl {
    _isCreatControl = YES;
    // 滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height - kBottomBarHeight)];
    scrollView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    //问题标签
    UILabel *questionLabel = [[UILabel alloc] init];
    questionLabel.textColor = RGB(0, 0, 0);
    questionLabel.font = [UIFont systemFontOfSize:15.f];
    questionLabel.numberOfLines = 0;
    [scrollView addSubview:questionLabel];
    self.questionlabel = questionLabel;
    //    self.materialView = [[ATMaterialView alloc] init];
    //    if ([_model.questionid isEqualToString:@"1001"]) {
    ATMaterialView *materialView = [[ATMaterialView alloc] init];
    [scrollView addSubview:materialView];
    self.materialView = materialView;
    self.materialView.hidden = YES;
    //    }else {
    UIImageView *showImageV = [[UIImageView alloc] init];
    [scrollView addSubview:showImageV];
    self.showImageV = showImageV;
    //    }
    
}

//刷新布局
- (void)reloadView
{
    //刷新问题相关数据
    NSString *questionlabelText = [NSString stringWithFormat:@"%ld. %@", _page, _model.question];
    
    _questionlabel.text = questionlabelText;
    _questionlabel.frame = CGRectMake(10, 10, Screen_Width - 20, 21);
    
    if ([_model.questionid isEqualToString:@"1001"]) {
        NSLog(@"1111");
        _materialView.hidden = NO;
        _materialView.model = _model;
        _materialView.frame = CGRectMake(10, CGRectGetMaxY(_questionlabel.frame) + 56/2, Screen_Width - 20, 200);
        _materialView.backgroundColor = [UIColor purpleColor];
    }else {
        NSLog(@"2222");
        _showImageV.image = [UIImage imageNamed:_model.imageUrl];
        CGFloat imageViewHeight = [UIImage resizedImage:_model.imageUrl].size.height;
        ATLog(@" imageViewHeight-%lf",imageViewHeight);
        _showImageV.frame = CGRectMake(10, CGRectGetMidY(_questionlabel.frame) + 56/2, Screen_Width - 20, imageViewHeight);
    }
    // 设置滚动区域内容
    if ([_model.questionid isEqualToString:@"1001"]) {
        _scrollView.contentSize = CGSizeMake(Screen_Width, CGRectGetMaxY(_materialView.frame) + 44);
    }else {
        _scrollView.contentSize = CGSizeMake(Screen_Width, CGRectGetMaxY(_showImageV.frame) + 44);
    }
}

//刷新底部视图状态
- (void)reloadBottomToolViewState
{
    UIButton *btn = (UIButton *)[self.bottomTool viewWithTag:0];
    btn.enabled = _page == 0 ? NO : YES;
    UIButton *otButton = (UIButton *)[self.bottomTool viewWithTag:1];
    otButton.enabled = _page == [_model.totalCount integerValue] ? NO : YES;
}

- (ATAnswerBtnBottomTool *)bottomTool {
    if (!_bottomTool) {
        _bottomTool = [ATAnswerBtnBottomTool viewFromXib];
        @weakify(self);
        _bottomTool.nextAnswerBtnBlock = ^(UIButton *btn,NSInteger tag) {
            ATLog(@"tag %ld",(long)tag);
            @strongify(self);
            //            tag ? self.page++ : self.page--;
            self.page++;
            if (self.page > 3) {
                self.page = 0;
            }
            //获取目标题目信息
            [self getQuestionsInfo];
            //            [self reloadBottomToolViewState];
            
        };
    }
    return _bottomTool;
}

- (NSMutableArray *)questionsArray {
    if (!_questionsArray) {
        _questionsArray = [NSMutableArray array];
    }
    
    return _questionsArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

