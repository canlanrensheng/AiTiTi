//
//  BaseViewModel.m
//  ZhuanMCH
//
//  Created by txooo on 16/8/31.
//  Copyright © 2016年 张金山. All rights reserved.
//

#import "BaseViewModel.h"
#import "ATNavigationController.h"

@interface BaseViewModel ()

@property (nonatomic, copy, readwrite) NSDictionary *params;

@end

@implementation BaseViewModel

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    BaseViewModel *viewModel = [super allocWithZone:zone];
    [viewModel tx_initialize];
    return viewModel;
}

- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super init]) {
        self.params = params;
    }
    return self;
}

- (void)tx_initialize {};

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [VisibleViewController().navigationController pushViewController:viewController animated:animated];
}

- (void)popViewControllerAnimated:(BOOL)animated {
    [VisibleViewController().navigationController popViewControllerAnimated:animated];
}

- (void)popToRootViewControllerAnimated:(BOOL)animated {
    [VisibleViewController().navigationController popToRootViewControllerAnimated:animated];
}

- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated completion:(dispatch_block_t)completion {
    if (![viewController isKindOfClass:UINavigationController.class]) {
        viewController = [[ATNavigationController alloc] initWithRootViewController:viewController];
    }
    [VisibleViewController() presentViewController:viewController animated:animated completion:completion];
}

- (void)tx_dismissViewControllerAnimated:(BOOL)animated completion:(dispatch_block_t)completion {
    [VisibleViewController() dismissViewControllerAnimated:animated completion:completion];
}

- (RACCommand *)loadDataCommand {
    if (!_loadDataCommand) {
        @weakify(self);
        _loadDataCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                @strongify(self);
                if ([self respondsToSelector:@selector(loadData:subscriber:)]) {
                    [self loadData:input subscriber:subscriber];
                }
                return nil;
            }];
        }];
    }
    return _loadDataCommand;
}

- (RACCommand *)universalCommand {
    if (!_universalCommand) {
        @weakify(self);
        _universalCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            @strongify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                @strongify(self);
                if ([self respondsToSelector:@selector(universalRACCommand:subscriber:)]) {
                    [self universalRACCommand:input subscriber:subscriber];
                }
                return nil;
            }];
        }];
    }
    return _universalCommand;
}

@end