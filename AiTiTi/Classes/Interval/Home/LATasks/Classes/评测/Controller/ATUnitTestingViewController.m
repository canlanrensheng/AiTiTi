//
//  ATUnitTestingViewController.m
//  AiTiTi
//
//  Created by LA on 2018/6/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATUnitTestingViewController.h"
#import "ATUnitTestingCell.h"
#import "ATUnitTestingModel.h"
#import "ATUnitTestingViewModel.h"
#import "ATStartTestingBottomTool.h"
#import "ATAnswerViewController.h"

@interface ATUnitTestingViewController ()
@property (nonatomic, strong) UIView *titleBgView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) ATUnitTestingViewModel *viewModel;
@property (nonatomic, strong) ATUnitTestingModel *lastModel;
@property (nonatomic, strong) ATStartTestingBottomTool *bottomTool;

@end

@implementation ATUnitTestingViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStylePlain;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews {
    self.navigationItem.title = @"单元测评";
    [self.titleBgView addSubview:self.titleLabel];
    [self.titleBgView addSubview:self.lineView];
    [self.tableView setTableHeaderView:self.titleBgView];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableViewRowHeight = 127/2;
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0,0, 0));
    }];
    NSArray *dictArr = @[
                         @{@"title":@"基础巩固"},
                         @{@"title":@"一轮复习"},
                         @{@"title":@"基础巩固"}
                         ];
    NSArray *tempArr = [ATUnitTestingModel mj_objectArrayWithKeyValuesArray:dictArr];
    [self.viewModel.dataArray removeAllObjects];
    [self.viewModel.dataArray addObjectsFromArray:tempArr];
    [self.tableView reloadData];
    ATUnitTestingModel *firstModel = self.viewModel.dataArray.firstObject;
    firstModel.isSelect = YES;
    _lastModel = firstModel;
    [self.view addSubview:self.bottomTool];
    [self.bottomTool mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(kBottomBarHeight);
    }];
}

- (void)tx_loadData {
    
}

- (void)tx_bindViewModel {
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATUnitTestingCell *cell = [ATUnitTestingCell getTableView:tableView forIndexPath:indexPath];
    cell.model = self.viewModel.dataArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _lastModel.isSelect = NO;
    ATUnitTestingModel *model = self.viewModel.dataArray[indexPath.row];
    model.isSelect = YES;
    _lastModel = model;
    [self.tableView reloadData];
}

- (ATStartTestingBottomTool *)bottomTool {
    if (!_bottomTool) {
        _bottomTool = [ATStartTestingBottomTool viewFromXib];
        @weakify(self);
        _bottomTool.startTestingBtnBlock = ^{
            @strongify(self);
            ATLog(@"%@",self.lastModel.title);
            ATAnswerViewController *answerVC = [[ATAnswerViewController alloc] init];
            [self.navigationController pushViewController:answerVC animated:YES];
        };
    }
    return _bottomTool;
}

- (ATUnitTestingViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[ATUnitTestingViewModel alloc] init];
    }
    return _viewModel;
}


- (UIView *)titleBgView {
    if (!_titleBgView) {
        _titleBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 110/2)];
    }
    return _titleBgView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel creatLabel:^(UILabel *label) {
            label.ljFrame(20,(55 - 35/2)/2,Screen_Width - 40,35/2);
            label.ljTitle_font_textColor(@"选择你要测试的知识点",H18,RGB(51, 51, 51));
            label.ljAligment(TextAlignmentCenter);
        }];
    }
    return _titleLabel;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleBgView.frame), Screen_Width, onePixel)];
        _lineView.backgroundColor = RGB(238, 239, 240);
    }
    return _lineView;
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
