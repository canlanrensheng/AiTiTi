//
//  ATDefinePlanViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATDefinePlanViewController.h"

#import "ATDefinePlanViewModel.h"
#import "ATDefinePlanTextCell.h"
#import "ATClassListCell.h"
#import "ATDefineTimePlanCell.h"
#import "ATClassListSectionHeaderView.h"
@interface ATDefinePlanViewController ()

@property (nonatomic,strong) ATDefinePlanViewModel *viewModel;

@end

@implementation ATDefinePlanViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews{
    self.title = @"制定计划";
    UIButton *saveBtn = [UIButton buttonWithtitle:@"保存" titleColor:RGB(102, 102, 102) backGroundColor:white_color Font:H13 cornerRadius:11.5 action:^(id sender) {
        
    }];
    saveBtn.frame = CGRectMake(0, 0, 51, 23);
    saveBtn.layer.borderColor = RGB(102, 102, 102).CGColor;
    saveBtn.layer.borderWidth = 1.0f;
    saveBtn.layer.cornerRadius = 11.5;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
    
//    self.tableViewRowHeight = 55;
//    self.numberOfSections = 3;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerNib:[UINib nibWithNibName:@"ATDefinePlanTextCell" bundle:nil] forCellReuseIdentifier:@"ATDefinePlanTextCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ATClassListCell" bundle:nil] forCellReuseIdentifier:@"ATClassListCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ATDefineTimePlanCell" bundle:nil] forCellReuseIdentifier:@"ATDefineTimePlanCell"];
    
    
    
//    [self.tableView registerNibHeaderFooter:[ATClassListSectionHeaderView class]];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
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
    if(indexPath.section == 0){
        return 53;
    }
    if(indexPath.section == 1){
        return 51;
    }
    CGFloat height =  29 + 20 + 30 + 20 + 30 + 6 * 40 + 60;
    return height;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 3;
    }
    if(section == 1){
        return 4;
    }
    return 1;
//    return self.viewModel.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        ATDefinePlanTextCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATDefinePlanTextCell"];
        self.tableView.separatorColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setViewModel:self.viewModel indexPath:indexPath];
        return cell;
    }
    
    if(indexPath.section == 1){
        ATClassListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATClassListCell"];
        self.tableView.separatorColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        //    [cell setViewModel:self.viewModel indexPath:indexPath];
        return cell;
    }
    ATDefineTimePlanCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATDefineTimePlanCell"];
    self.tableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    [cell setViewModel:self.viewModel indexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 1){
        static NSString * identy = @"ATClassListSectionHeaderView";
        ATClassListSectionHeaderView *sectionHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:identy];
        if (!sectionHeaderView) {
            sectionHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"ATClassListSectionHeaderView" owner:self options:nil] lastObject];
            sectionHeaderView.backgroundColor = [UIColor whiteColor];
        }
        return sectionHeaderView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 1){
        return 70;
    }
    return 0.0001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if(section == 0 || section == 1){
        UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_Width, 10)];
        footerView.backgroundColor = RGB(240, 240, 240);
        return footerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 0 || section == 1){
        return 10.0f;
    }
    return 0.0001f;
}

- (ATDefinePlanViewModel *)viewModel{
    if(!_viewModel){
        _viewModel = [[ATDefinePlanViewModel alloc] init];
    }
    return _viewModel;
}

@end


