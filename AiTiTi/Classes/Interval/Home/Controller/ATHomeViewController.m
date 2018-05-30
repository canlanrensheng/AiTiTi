//
//  ATHomeViewController.m
//  AiTiTi
//
//  Created by 云辉 on 2018/4/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATHomeViewController.h"
#import "ATSearchViewController.h"
#import "ATHomeNavBar.h"
#import "ATMessagesViewController.h"
#import "ATHomeMainCell.h"
#import "ATHomeRecommendCell.h"
#import "ATHomeHeader.h"
#import "ATSectionHeader.h"
#import "ATSubjectViewController.h"
#import "ATCourseController.h"
#import "ATTeacherExplainController.h"
#import "ATKOViewController.h"
#import "ATEvaluationViewController.h"
#import "ATQRCodeScanViewController.h"
#import "ATSelectGradeBtn.h"
#import "ATSignViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "ATTeacherTalkViewController.h"
#import "ATStudyPlanViewController.h"
@interface ATHomeViewController ()<UITableViewDelegate,UITableViewDataSource,ATHomeHeaderBtnDelegate>
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArr;
@end

@implementation ATHomeViewController
static NSString *const recommendCellID = @"recommendCell";
static NSString *const mainCellID = @"mainCell";

#pragma  mark - LazyLoading
- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.hidden = YES;
    
    //导航栏
//        ATHomeNavBar *homeBar = [ATHomeNavBar homeNavBar];
//        [self.view addSubview:homeBar];
    
    [self setUpNav];
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, ATScreenWidth, ATScreenHeight - kNavigationBarHeight) style:UITableViewStylePlain];
    self.tableView = tableView;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.dataSource = self;
    tableView.delegate = self;
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATHomeRecommendCell class]) bundle:nil] forCellReuseIdentifier:recommendCellID];
    [tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATHomeMainCell class]) bundle:nil] forCellReuseIdentifier:mainCellID];
    ATHomeHeader *header = [[ATHomeHeader alloc] initWithFrame:CGRectMake(0, 0, ATScreenWidth, 1)];
    header.delegate = self;
    tableView.tableHeaderView = header;
    
    [self.view addSubview:tableView];
}


- (void)setUpNav{
    //签到
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"" image:IMAGE(@"signIn") action:^(id sender) {
        ATSignViewController *signVC = [[ATSignViewController alloc] init];
        [self.navigationController pushViewController:signVC  animated:YES];
    }];
    
    ATSelectGradeBtn *midBtn = [[ATSelectGradeBtn alloc] initWithFrame:CGRectMake((ATScreenWidth - 100) * 0.5, 20, 100, 30)];
    [midBtn setTitle:@"高一" forState:UIControlStateNormal];
    [midBtn addTarget:self action:@selector(selectGarde:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = midBtn;
    
    //+号
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithTitle:@"" image:IMAGE(@"header_add") action:^(id sender) {
        
        NSArray *titles = @[@"  搜索",@"  消息",@"  扫一扫"];
        NSArray *images = @[@"搜索",@"弹窗消息",@"扫一扫"];
        MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100 - 10, 0, 100, 44 * titles.count) WithTitles:titles WithImageNames:images WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:80];
        menuView.didSelectBlock = ^(NSInteger index) {
            switch (index) {
                case 0:{
                    //搜索
                    ATSearchViewController *searchVC = [[ATSearchViewController alloc] init];
                    [self.navigationController pushViewController:searchVC animated:YES];
                }
                    break;
                case 1:{
                    //消息
                    ATMessagesViewController *searchVC = [[ATMessagesViewController alloc] init];
                    [self.navigationController pushViewController:searchVC animated:YES];
                }
                    break;
                default:{
                    //扫一扫
                    ATQRCodeScanViewController *searchVC = [[ATQRCodeScanViewController alloc] init];
                    [self QRCodeScanVC:searchVC];
                }
                    break;
            }
        };
        [menuView showMenuEnterAnimation:MLEnterAnimationStyleRight];
    }];
}

//高一弹窗
- (void)selectGarde:(UIButton *)button{
    NSArray *titles = @[@"高一",@"高二",@"高三"];
    MLMenuView *menuView = [[MLMenuView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width / 2 - 50, 0, 100, 44 * titles.count) WithTitles:titles WithImageNames:nil WithMenuViewOffsetTop:k_StatusBarAndNavigationBarHeight WithTriangleOffsetLeft:52];;
    menuView.didSelectBlock = ^(NSInteger index) {
        NSLog(@"%zd",index);
    };
    [menuView showMenuEnterAnimation:MLEnterAnimationStyleNone];
}

- (void)requestData {
    [[ATNetWorking sharedManager] getResultWithParameter:nil url:homeClassicTopics successBlock:^(id responseBody) {
        
        ATLog(@"data:%@",responseBody);
        [self.tableView reloadData];
        
    } failureBlock:^(NSString *error) {
        ATLog(@"error:%@",error);
        
    }];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        ATHomeRecommendCell *recommendCell = [tableView dequeueReusableCellWithIdentifier:recommendCellID];
        cell = recommendCell;
        
    }else {
        ATHomeMainCell *mainCell = [tableView dequeueReusableCellWithIdentifier:mainCellID];
        cell = mainCell;
    }
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    ATSectionHeader *sectionHeader;
    if (section == 0) {
        ATSectionHeader *keyPointHeader = [ATSectionHeader sectionHeaderWithImage:[UIImage imageNamed:@"section_header_blue"] title:@"重点推荐" subTitle: nil];
        sectionHeader = keyPointHeader;
    }else if (section == 1) {
        ATSectionHeader *systemHeader = [ATSectionHeader sectionHeaderWithImage:[UIImage imageNamed:@"section_header_org"] title:@"系统复习推荐" subTitle:@"更多复习推荐"];
        sectionHeader = systemHeader;
    }else if (section == 2) {
        ATSectionHeader *hotHeader = [ATSectionHeader sectionHeaderWithImage:[UIImage imageNamed:@"section_header_blue"] title:@"热门专题推荐" subTitle:@"更多专题推荐"];
        sectionHeader = hotHeader;
    }
    return sectionHeader;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 200;
    }
    return 180;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

#pragma mark - ATHomeHeaderBtnDelegate
- (void)homeHeader:(ATHomeHeader *)homeHeader btnDidClicker:(UIButton *)btn {
    if ([btn.titleLabel.text isEqualToString:@"专题"]) {
        ATSubjectViewController *subjectVC = [[ATSubjectViewController alloc] init];
        [self.navigationController pushViewController:subjectVC animated:YES];
    }else if ([btn.titleLabel.text isEqualToString:@"系统课"]) {
        ATCourseController *courseVC = [[ATCourseController alloc] init];
        [self.navigationController pushViewController:courseVC animated:YES];
    }else if ([btn.titleLabel.text isEqualToString:@"名师讲题"]) {
        ATTeacherTalkViewController *teacherExplainVC = [[ATTeacherTalkViewController alloc] init];
        [self.navigationController pushViewController:teacherExplainVC animated:YES];
    }else if ([btn.titleLabel.text isEqualToString:@"K.O计划"]) {
        ATStudyPlanViewController *koVC = [[ATStudyPlanViewController alloc] init];
        [self.navigationController pushViewController:koVC animated:YES];
    }else if ([btn.titleLabel.text isEqualToString:@"评测"]) {
        ATEvaluationViewController *evaluationVC = [[ATEvaluationViewController alloc] init];
        [self.navigationController pushViewController:evaluationVC animated:YES];
    }
}

- (void)QRCodeScanVC:(UIViewController *)scanVC {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (status) {
            case AVAuthorizationStatusNotDetermined: {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                        dispatch_sync(dispatch_get_main_queue(), ^{
                            [self.navigationController pushViewController:scanVC animated:YES];
                        });
                        NSLog(@"用户第一次同意了访问相机权限 - - %@", [NSThread currentThread]);
                    } else {
                        NSLog(@"用户第一次拒绝了访问相机权限 - - %@", [NSThread currentThread]);
                    }
                }];
                break;
            }
            case AVAuthorizationStatusAuthorized: {
                [self.navigationController pushViewController:scanVC animated:YES];
                break;
            }
            case AVAuthorizationStatusDenied: {
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                [alertC addAction:alertA];
                [self presentViewController:alertC animated:YES completion:nil];
                break;
            }
            case AVAuthorizationStatusRestricted: {
                NSLog(@"因为系统原因, 无法访问相册");
                break;
            }
                
            default:
                break;
        }
        return;
    }
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:alertA];
    [self presentViewController:alertC animated:YES completion:nil];
}


@end
