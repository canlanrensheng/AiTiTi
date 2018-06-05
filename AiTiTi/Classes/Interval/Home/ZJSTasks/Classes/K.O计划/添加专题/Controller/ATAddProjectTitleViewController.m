//
//  ATAddProjectTitleViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/4.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATAddProjectTitleViewController.h"

#import "ATProjectTittleListCell.h"

@interface ATAddProjectTitleViewController ()


@property (nonatomic,strong) UIButton *selectButton;

@end

@implementation ATAddProjectTitleViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews{
    self.title = @"添加专题";
    
    
    [self.view addSubview:self.selectButton];
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-13);
        make.left.equalTo(self.view).offset(63);
        make.right.equalTo(self.view).offset(-63);
        make.height.mas_equalTo(40);
    }];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"ATProjectTittleListCell" bundle:nil] forCellReuseIdentifier:@"ATProjectTittleListCell"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 53, 0));
    }];

}

- (void)tx_loadData{
    //    if(self.viewModel.dataArray.count > 0){
    //        [self.tableView.mj_footer resetNoMoreData];
    //    }
    //
    //    [self.viewModel.loadDataCommand execute:nil];
    //    self.tableView.mj_footer.hidden = YES;
}


- (void)tx_bindViewModel{
    //    @weakify(self);
    //    [self.viewModel.loadDataCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
    //        @strongify(self);
    //
    //        [self.tableView reloadData];
    //    }];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 190;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
    //    return self.viewModel.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATProjectTittleListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATProjectTittleListCell"];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    [cell setViewModel:self.viewModel indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
    
    //    static NSString * identy = @"ATExamPaperSectionView";
    //    ATExamPaperSectionView *sectionHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identy];
    //    if (!sectionHeaderView) {
    //        sectionHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"ATExamPaperSectionView" owner:self options:nil] lastObject];
    //        sectionHeaderView.backgroundColor = [UIColor whiteColor];
    //    }
    //    ATExamPaperModel *model = self.viewModel.dataArray[section];
    //    @weakify(self);
    //    [sectionHeaderView.openButtonSubject subscribeNext:^(id x) {
    //        @strongify(self);
    //        model.isShow = !model.isShow;
    //        NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndex:section];
    //        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
    //    }];
    //    return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001f;
}

//- (ATExamPaperViewModel *)viewModel{
//    if(!_viewModel){
//        _viewModel = [[ATExamPaperViewModel alloc] init];
//    }
//    return _viewModel;
//}

- (UIButton *)selectButton{
    if(!_selectButton){
        _selectButton = [UIButton creatButton:^(UIButton *button) {
            button.ljTitle_font_titleColor_state(@"已选题目 (3)",H15,white_color,0);
            button.ljCornerRadius_borderWidth_borderColor(20.0,0,nil);
            button.backgroundColor = RGB(45, 180, 255);
            //@weakify(self);
            [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                //@strongify(self);
               
            }];
        }];
    }
    return _selectButton;
}

@end


