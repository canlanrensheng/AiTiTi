//
//  ATCommentBackViewController.m
//  AiTiTi
//
//  Created by LA on 2018/6/4.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATCommentBackViewController.h"
#import "ATCommentCell.h"
#import "ATSectionHeader.h"
#import "ATTextFieldBottomTool.h"

@interface ATCommentBackViewController ()
@property (nonatomic, strong) ATTextFieldBottomTool *bottomTool;

@end

@implementation ATCommentBackViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    
}

- (void)tx_configSubViews {
    self.navigationItem.title = @"评论回复";
    self.numberOfSections = 1;
    self.tableViewRowHeight = 110;
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATCommentCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([ATCommentCell class])];

    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(-10, 0, 0, 0));
    }];
    
    self.bottomTool = [[[NSBundle mainBundle] loadNibNamed:@"ATTextFieldBottomTool" owner:self options:nil] lastObject];
    [self.view addSubview:self.bottomTool];
    self.bottomTool.releaseBtnBlock = ^(NSString *text) {
        ATLog(@"text %@",text);
    };
    [self.bottomTool mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.mas_equalTo(49);
    }];


}

- (void)tx_loadData {
    
}

- (void)tx_bindViewModel {
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ATCommentCell *cell = [ATCommentCell getTableView:tableView forIndexPath:indexPath];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ATSectionHeader *commentHeader = [ATSectionHeader sectionHeaderWithImage:nil title:@"全部评论12" subTitle:nil];

    return commentHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

//- (ATTextFieldBottomTool *)bottomTool {
//    if (!_bottomTool) {
//        _bottomTool = [ATTextFieldBottomTool viewFromXib];
//        _bottomTool.frame = CGRectMake(0, Screen_Height - 49, Screen_Width, 49);
//        _bottomTool.backgroundColor = [UIColor greenColor];
//    }
//    return _bottomTool;
//}

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
