//
//  ATSystemClassCommentController.m
//  AiTiTi
//
//  Created by LA on 2018/6/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSystemClassCommentController.h"
#import "ATCommentCell.h"
#import "ATCommentView.h"
#import "ATCommentMenuView.h"
#import "ATReportView.h"
#import "ATCommentBackViewController.h"

@interface ATSystemClassCommentController ()
@property (nonatomic, strong) ATCommentView *commnetView;
@property (nonatomic, strong) ATCommentMenuView *menuView;
@property (nonatomic, strong) ATReportView *reportView;

@end

@implementation ATSystemClassCommentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
    [self.menuView la_dismiss];
    [self.reportView la_dismiss];
}

- (void)setupUI {
    [self.tableView setTableHeaderView:self.commnetView];
    @weakify(self);
    self.commnetView.writeBtnBlock = ^{
        @strongify(self);
        self.menuView = [[ATCommentMenuView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
        self.menuView.commitBtnBlock = ^(NSString *text) {
            //            @strongify(self);
        };
        [self.menuView la_show];
        
    };
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        ATCommentBackViewController *commentBackVC = [[ATCommentBackViewController alloc] init];
        [self.navigationController pushViewController:commentBackVC animated:YES];
        return;
    }
    
    // 当menuController显示依赖于第一响应者，当点击另外的cell时，当前cell取消第一响应者状态，menuController自动消失
    UIMenuController *menu = [UIMenuController sharedMenuController];
    // 防止点击多次创建
    if (menu.isMenuVisible) {
        [menu setMenuVisible:NO animated:YES];
    }else {
        ATCommentCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        [cell becomeFirstResponder];
        UIMenuItem *copyItem = [[UIMenuItem alloc] initWithTitle:@"复制" action:@selector(copyAction:)];
        UIMenuItem *reportItem = [[UIMenuItem alloc] initWithTitle:@"举报" action:@selector(reportAction:)];
        menu.menuItems = @[copyItem,reportItem];
        [menu setTargetRect:CGRectMake(0, cell.frame.size.height * 0.5, cell.frame.size.width, cell.frame.size.height) inView:cell];
        [menu setMenuVisible:YES animated:NO];
    }
}

#pragma mark - MenuControllerAction
- (void)copyAction:(UIMenuController *)menu {
    ATLog(@"复制");
}

- (void)reportAction:(UIMenuController *)menu {
    ATLog(@"举报");
    ATReportView *reportView = [[ATReportView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, Screen_Height)];
    self.reportView = reportView;
    reportView.commitBlock = ^{
        
    };
    [reportView la_show];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    UIMenuController *menu = [UIMenuController sharedMenuController];
    [menu setMenuVisible:NO animated:YES];
}

- (ATCommentView *)commnetView {
    if (!_commnetView) {
        _commnetView = [[ATCommentView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 76/2)];
    }
    return _commnetView;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
