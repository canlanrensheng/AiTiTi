//
//  ATAddTitleViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/5.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATAddTitleViewController.h"


#import "ATAddTitleCell.h"

#import "JPullDownMenu.h"
#define kSubjectHeaderHeight 50
@interface ATAddTitleViewController ()

//@property (nonatomic,strong) ATExamPaperViewModel *viewModel;
@property (nonatomic) JPullDownMenu *menu;
@property (nonatomic,strong) UIButton *selectButton;

@end

@implementation ATAddTitleViewController

- (void)viewDidLoad {
    self.tableViewStyle = UITableViewStyleGrouped;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tx_configSubViews{
    self.title = @"添加题目";
    self.tableViewRowHeight = 55;
    [self.view addSubview:self.selectButton];
    [self.selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-13);
        make.left.equalTo(self.view).offset(63);
        make.right.equalTo(self.view).offset(-63);
        make.height.mas_equalTo(40);
    }];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self setUpMenuView];
    [self.tableView registerNib:[UINib nibWithNibName:@"ATAddTitleCell" bundle:nil] forCellReuseIdentifier:@"ATAddTitleCell"];
    
    [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(kSubjectHeaderHeight, 0, 53, 0));
    }];
}

- (void)setUpMenuView{
    self.menu = [[JPullDownMenu alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, kSubjectHeaderHeight) menuTitleArray:@[@"数学",@"高一",@"精选"]];
    
    NSArray * regionArray =@[@{@"title":@"数学",@"image":@""},@{@"title":@"语文",@"image":@""},@{@"title":@"大题",@"image":@"VIP1"},@{@"title":@"精品课程",@"image":@"VIP2"}];
    NSArray *classTypeArray=@[@{@"title":@"高一",@"image":@""},@{@"title":@"语文",@"image":@""},@{@"title":@"大题",@"image":@"VIP1"},@{@"title":@"精品课程",@"image":@"VIP2"}];
    NSArray *sortRuleArray=@[@{@"title":@"精选",@"image":@""},@{@"title":@"语文",@"image":@""},@{@"title":@"大题",@"image":@"VIP1"},@{@"title":@"精品课程",@"image":@"VIP2"}];
    
    
    self.menu.menuDataArray = [NSMutableArray arrayWithObjects:regionArray, classTypeArray , sortRuleArray,  nil];
    
    [self.view addSubview:self.menu];
    
    __weak typeof(self) _self = self;
    [self.menu setHandleSelectDataBlock:^(NSString *selectTitle, NSUInteger selectIndex, NSUInteger selectButtonTag) {
        
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
    return 237;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
//    return self.viewModel.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATAddTitleCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ATAddTitleCell"];
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


