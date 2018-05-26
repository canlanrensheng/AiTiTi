//
//  BaseTableViewController.m
//  ZhuanMCH
//
//  Created by txooo on 16/12/6.
//  Copyright © 2016年 张金山. All rights reserved.
//

#import "BaseTableViewController.h"

@interface BaseTableViewController ()



@end

@implementation BaseTableViewController

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero
                                                 style:self.tableViewStyle];
        _tableView.delegate = self;
        _tableView.dataSource = self;
//        _tableView.emptyDataSetSource = self;
//        _tableView.emptyDataSetDelegate = self;
        _tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
        _tableView.backgroundColor = Background_Color;
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    }
    return _tableView;
}

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)updateViewConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.mas_equalTo(self.view);
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, KHomeIndicatorHeight, 0));
    }];
    [super updateViewConstraints];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = Background_Color;
    [self.view addSubview:self.tableView];
    [self tx_refreshData];
    
   
    [self.view updateConstraintsIfNeeded];

}

- (void)tx_refreshData{};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource&delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _numberOfSections ? : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _numberOfRows ? : _dataArray ? _dataArray.count : 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"BaseCellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellId];
    }
    cell.textLabel.font = [UIFont  systemFontOfSize:15];
    cell.textLabel.textColor = RGB(51, 51, 51);
    if ([self respondsToSelector:@selector(configTableViewCell:cellForRowAtIndexPath:)]) {
        [self configTableViewCell:cell cellForRowAtIndexPath:indexPath];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _tableViewRowHeight ? : 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return _sectionHeaderHeight ? : 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return _sectionFooterHeight ? : 0.01f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = Background_Color;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = Background_Color;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_tableViewRowSelectBlock) {
        _tableViewRowSelectBlock(indexPath);
    }
}



//#pragma 空白页代理方法
//- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView{
//    return YES;
//}
//
////没有数据的代理方法
////- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
////    NSString *text = @"\U0000Ea30";
////    NSDictionary *attribute = @{NSFontAttributeName: [UIFont fontWithName:@"iconfontv2" size:70], NSForegroundColorAttributeName: MYColorFromHEX(0x999999)};
////    return [[NSAttributedString alloc] initWithString:text attributes:attribute];
////}
//
//- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView{
//    NSString *text = @"暂时无数据哦！";
//    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: MYColorFromHEX(0x999999)};
//    return [[NSAttributedString alloc] initWithString:text attributes:attribute];
//}
//
//- (UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView {
//    return Background_Color;
//}
//
//- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
//    NSString *buttonTitle = @"重新加载";
//    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:16], NSForegroundColorAttributeName: NavigationBar_Color
//                                 ,NSBackgroundColorAttributeName:[UIColor clearColor]};
//    return [[NSAttributedString alloc] initWithString:buttonTitle attributes:attributes];
//}




@end
