//
//  BaseViewController.m
//  Zhuan
//
//  Created by txooo on 16/3/1.
//  Copyright © 2016年 张金山. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseViewModel.h"

@interface BaseViewController ()

@property (nonatomic,strong) NSDictionary *params;

@property (nonatomic,strong) BaseViewModel *viewModel;

@end

@implementation BaseViewController

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewController *viewController = [super allocWithZone:zone];
    @weakify(viewController)
    [[viewController rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(id x) {
        @strongify(viewController)
        [viewController tx_bindViewModel];
        [viewController tx_loadData];
        [viewController tx_configSubViews];
        [viewController setTitleView];
    }];
    return viewController;
}

- (BaseViewController *)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        self.viewModel = viewModel;
    }
    return self;
}

- (instancetype)initWithParams:(NSDictionary *)params {
    self = [super init];
    if (self) {
        self.params = params;
        self.navigationItem.title = params[@"title"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.view.backgroundColor = [UIColor whiteColor];
    if (@available(ios 11.0,*)) {
        [[UIScrollView appearance] setContentInsetAdjustmentBehavior:UIScrollViewContentInsetAdjustmentNever];
    }
}

- (void)setTitleView {
  
}

- (void)tx_configSubViews {};

- (void)tx_bindViewModel {};

- (void)tx_loadData {};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIActivityIndicatorView *)activityView {
    if (!_activityView) {
        _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityView.hidesWhenStopped = YES;
        [self.view addSubview:_activityView];
        
        [_activityView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.center.mas_equalTo(self.view);
        }];
    }
    return _activityView;
}

- (RACSubject *)completionSubject{
    if (!_completionSubject) {
        _completionSubject = [RACSubject subject];
    }
    return _completionSubject;
}

@end
