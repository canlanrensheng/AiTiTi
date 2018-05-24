//
//  ATSubjectViewController.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/15.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubjectViewController.h"
#import "ATSubjectHeader.h"
#import "ATSubjectSectionHeader.h"
#import "ATSubjectMainCell.h"
#import "CFDropDownMenuView.h"
#import "ATSubjectDetailController.h"

#define kSubjectHeaderHeight 50

@interface ATSubjectViewController ()<ATNavigationBarDelegate,CFDropDownMenuViewDelegate,UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@property (nonatomic,strong) NSMutableArray *sectionArray;
@property (nonatomic,strong) NSMutableArray *flagArray;
/* CFDropDownMenuView */
@property (nonatomic, strong) CFDropDownMenuView *dropDownMenuView;
@property (nonatomic,weak) ATNavigationBar *navBar;
/* 所有的 假数据源 */
//@property (nonatomic, strong) NSMutableArray *allDataSourceArr;
///* 展示结果的 假数据源 */
//@property (nonatomic, strong) NSMutableArray *dataSourceArr;
@end

static NSString *cellID = @"ATSubjectMainCell";

@implementation ATSubjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self makeData];
    
    ATNavigationBar *navBar = [[ATNavigationBar alloc] initWithTitle:@"专题" leftName:nil rightName:nil delegate:self];
    _navBar = navBar;
    
    // 配置CFDropDownMenuView
    [self.view addSubview:self.dropDownMenuView];
    
    /*
    ATSubjectHeader *subjectHeader = [[ATSubjectHeader alloc] initWithFrame:CGRectMake(0, navBar.bottom, ATScreenWidth, kSubjectHeaderHeight)];
    [self.view addSubview:subjectHeader];
     */
    
   UITableView *tableView = [UITableView tableViewWithFrmae:CGRectMake(0, _dropDownMenuView.bottom, ATScreenWidth, ATScreenHeight - _dropDownMenuView.bottom) backgroundColor:[UIColor whiteColor] delegate:self tableViewStyle:UITableViewStylePlain separatorStyle:UITableViewCellSeparatorStyleNone superview:self.view];
    _tableView = tableView;
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATSubjectMainCell class]) bundle:nil] forCellReuseIdentifier:cellID];
    
}


#pragma mark - lazy
/* 配置CFDropDownMenuView */
- (CFDropDownMenuView *)dropDownMenuView
{
    // DEMO
    _dropDownMenuView = [[CFDropDownMenuView alloc] initWithFrame:CGRectMake(0, _navBar.bottom, ATScreenWidth, kSubjectHeaderHeight)];
    
    /**
     *  stateConfigDict 属性 格式 详见CFDropDownMenuView.h文件
     */
    //    _dropDownMenuView.stateConfigDict = @{
    //                                        @"selected" : @[[UIColor redColor], @"红箭头"],
    //                                        };
    //    _dropDownMenuView.stateConfigDict = @{
    //                                        @"normal" : @[[UIColor orangeColor], @"测试黄"],
    //                                        };
    //    _dropDownMenuView.stateConfigDict = @{
    //                                         @"selected" : @[CF_Color_DefaultColor, @"天蓝箭头"],
    //                                         @"normal" : @[[UIColor orangeColor], @"橙箭头"]
    //                                         };
    // 注:  需先 赋值数据源dataSourceArr二维数组  再赋值defaulTitleArray一维数组
    _dropDownMenuView.dataSourceArr = @[
                                        //                                        @[@"全部", @"iOS开发", @"安卓开发", @"JAVA开发", @"PHP开发",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m"],
                                        @[@"全部", @"iOS开发", @"安卓开发", @"JAVA开发", @"PHP开发"],
                                        @[@"5-10k", @"10-15k", @"15-20k", @"20k以上"],
                                        @[@"1年以内", @"1-3年", @"3-5年", @"5年以上"]
                                        ].mutableCopy;
    
    _dropDownMenuView.defaulTitleArray = [NSArray arrayWithObjects:@"工作岗位",@"薪资", @"工作经验", nil];
    
    _dropDownMenuView.delegate = self;
    
    // 下拉列表 起始y
    _dropDownMenuView.startY = CGRectGetMaxY(_dropDownMenuView.frame);
    
    /**
     *  回调方式一: block
     */
//    __weak typeof(self) weakSelf = self;
    _dropDownMenuView.chooseConditionBlock = ^(NSString *currentTitle, NSArray *currentTitleArray){
        /*
        
        // 实际开发情况 --- 仅需要拿到currentTitle / currentTitleArray 作为参数 向服务器请求数据即可
         
        NSMutableString *totalTitleStr = [[NSMutableString alloc] init];
        NSMutableString *totalStr = [[NSMutableString alloc] init];
        for (NSInteger i = 0; i < currentTitleArray.count; i++) {
            if (!([currentTitleArray[i] isEqualToString:@"工作岗位"]
                  || [currentTitleArray[i] isEqualToString:@"薪资"] || [currentTitleArray[i] isEqualToString:@"工作经验"])) {
                [totalStr appendString:currentTitleArray[i]];
            }
            
            if (0 == i) {
                [totalTitleStr appendString:@"("];
            }
            [totalTitleStr appendString:currentTitleArray[i]];
            if (i == currentTitleArray.count-1) {
                [totalTitleStr appendString:@")"];
                break ;
            }
            [totalTitleStr appendString:@"---"];
            
        }
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"职位筛选信息" message:[NSString stringWithFormat:@"您当前选中的是\n(%@)\n 当前所有展示的是\n%@", currentTitle, totalTitleStr] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            // 匹配数据源
            NSString *totalString = totalStr;
            // 如果筛选条件包含全部, 则截取掉
            if ([totalStr containsString:@"全部"]) {
                totalString = [totalStr stringByReplacingOccurrencesOfString:@"全部" withString:@""];
            }
            NSLog(@"totalString  %@", totalString);
            if (totalString.length != 0) {  // 条件 只是  全部
                NSArray *allDataSourceArr = weakSelf.allDataSourceArr;
                NSMutableArray *tempArr = [[NSMutableArray alloc] init];
                for (NSInteger i = 0; i < allDataSourceArr.count; i++) {
                    NSString *str = allDataSourceArr[i];
                    str = [str stringByReplacingOccurrencesOfString:@" " withString:@""];
                    
                    if ([str containsString:totalString]) {
                        [tempArr addObject:allDataSourceArr[i]];
                    }
                }
                // 赋值筛选后的数据源
                weakSelf.dataSourceArr = tempArr;
                NSLog(@"筛选后数据源  %@", weakSelf.dataSourceArr);
                
                // 重新刷新表格  --  显示刷新后的数据
                [weakSelf.tableView reloadData];
            }
            
            
            UIAlertController *alertController2 = [UIAlertController alertControllerWithTitle:@"" message:[NSString stringWithFormat:@"共有 %zd 条结果", weakSelf.dataSourceArr.count] preferredStyle:UIAlertControllerStyleAlert];
            [weakSelf presentViewController:alertController2 animated:NO completion:^{
                UIAlertAction *alertAction2 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                }];
                [alertController2 addAction:alertAction2];
            }];
            
        }];
        [alertController addAction:alertAction];
        [weakSelf presentViewController:alertController animated:NO completion:^{
        }];
        */
    };
    
    
    return _dropDownMenuView;
    
}


/**
 *  处理数据  _sectionArray里面存储数组
 */
- (void)makeData{
    _sectionArray = [NSMutableArray array];
    _flagArray  = [NSMutableArray array];
    NSInteger num = 6;
    for (int i = 0; i < num; i ++) {
        NSMutableArray *rowArray = [NSMutableArray array];
        for (int j = 0; j < arc4random()%20 + 1; j ++) {
            [rowArray addObject:[NSString stringWithFormat:@"%d",j]];
        }
        [_sectionArray addObject:rowArray];
        [_flagArray addObject:@"0"];
    }
}
//设置组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _sectionArray.count;
}
//设置行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *arr = _sectionArray[section];
    return arr.count;
}
//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 64;
}

//cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_flagArray[indexPath.section] isEqualToString:@"0"])
        return 0;
    else
        return 180;
}

//组头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    ATSubjectSectionHeader *sectionHeader = [ATSubjectSectionHeader subjectSectionHeaderWithModel];
    sectionHeader.userInteractionEnabled = YES;
    sectionHeader.tag = 100 + section;
    
     
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sectionClick:)];
    [sectionHeader addGestureRecognizer:tap];
    
    return sectionHeader;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATSubjectMainCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];

//    cell.textLabel.text= [NSString stringWithFormat:@"第%ld组的第%ld个cell",indexPath.section,indexPath.row];
    cell.clipsToBounds = YES;//这句话很重要,防止cell覆盖显示
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ATSubjectDetailController *detailVC = [[ATSubjectDetailController alloc] init];
    [self.navigationController pushViewController:detailVC animated:YES];
    
    
//    SectionViewController *sVC = [[SectionViewController alloc] init];
//    sVC.rowLabelText = [NSString stringWithFormat:@"第%d组的第%d个cell",indexPath.section,indexPath.row];
//    [self presentViewController:sVC animated:YES completion:nil];
}
- (void)sectionClick:(UITapGestureRecognizer *)tap{
    ATSubjectSectionHeader *sectionHeader = (ATSubjectSectionHeader *)tap.view;
    [sectionHeader changeArrowDirection];
    
    int index = tap.view.tag % 100;
    
    NSMutableArray *indexArray = [[NSMutableArray alloc]init];
    NSArray *arr = _sectionArray[index];
    for (int i = 0; i < arr.count; i ++) {
        NSIndexPath *path = [NSIndexPath indexPathForRow:i inSection:index];
        [indexArray addObject:path];
    }
    //展开
    if ([_flagArray[index] isEqualToString:@"0"]) {
        _flagArray[index] = @"1";
        [_tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationBottom];  //使用下面注释的方法就 注释掉这一句
    } else { //收起
        _flagArray[index] = @"0";
        [_tableView reloadRowsAtIndexPaths:indexArray withRowAnimation:UITableViewRowAnimationTop]; //使用下面注释的方法就 注释掉这一句
    }
    //另一种刷新方式
    //  NSRange range = NSMakeRange(index, 1);
    //  NSIndexSet *sectionToReload = [NSIndexSet indexSetWithIndexesInRange:range];
    //  [_tableView reloadSections:sectionToReload withRowAnimation:UITableViewRowAnimationAutomatic];
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
