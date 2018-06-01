//
//  ATCommentViewController.m
//  AiTiTi
//
//  Created by LA on 2018/5/29.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATCommentViewController.h"
#import "ATSearchView.h"
#import "ATCommentCell.h"

@interface ATCommentViewController ()

@property (nonatomic, strong)ATSearchView *searchView;

@end

@implementation ATCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUI];
}

- (void)setupUI {
    [self.tableView setTableHeaderView:self.searchView];
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATCommentCell *cell = [ATCommentCell getTableView:tableView forIndexPath:indexPath];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}

- (ATSearchView *)searchView {
    if (!_searchView) {
        _searchView = [[ATSearchView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 76/2)];
    }
    return _searchView;
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
