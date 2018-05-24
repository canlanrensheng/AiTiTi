//
//  ATDetailBottomCell.m
//  AiTiTi
//
//  Created by 童城 on 2018/5/13.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTeacherDetailBottomCell.h"
#import "ATDetailContentController.h"

@implementation ATTeacherDetailBottomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

#pragma mark Setter
- (void)setViewControllers:(NSMutableArray *)viewControllers
{
    _viewControllers = viewControllers;
}

- (void)setCellCanScroll:(BOOL)cellCanScroll
{
    _cellCanScroll = cellCanScroll;
    
    for (ATDetailContentController *VC in _viewControllers) {
        VC.vcCanScroll = cellCanScroll;
        if (!cellCanScroll) {//如果cell不能滑动，代表到了顶部，修改所有子vc的状态回到顶部
            VC.tableView.contentOffset = CGPointZero;
        }
    }
}

- (void)setIsRefresh:(BOOL)isRefresh
{
    _isRefresh = isRefresh;
    
    for (ATDetailContentController *ctrl in self.viewControllers) {
        if ([ctrl.title isEqualToString:self.currentTagStr]) {
            ctrl.isRefresh = isRefresh;
        }
    }
}
@end
