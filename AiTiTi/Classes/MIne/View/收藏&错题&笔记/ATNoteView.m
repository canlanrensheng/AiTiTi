//
//  ATNoteView.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/22.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATNoteView.h"
#import "ATNoteCell.h"

@interface ATNoteView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong) NSMutableArray * stateArray;

@end

@implementation ATNoteView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.stateArray = [NSMutableArray arrayWithArray:@[@0,@0,@0]];
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = ATWhite;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([self.stateArray[section] boolValue]) {
        return 10;
    }else{
        return 0;
    }
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATNoteCell * cell = [tableView dequeueReusableCellWithIdentifier:@"note"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ATNoteCell" owner:nil options:nil] firstObject];
    }
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * headerView = [UIView new];
    [headerView addJXTouch:^{
        if ([self.stateArray[section] boolValue]) {
            [self.stateArray replaceObjectAtIndex:section withObject:@0];
        }else{
            [self.stateArray replaceObjectAtIndex:section withObject:@1];
        }
        [self.tableView reloadData];
    }];
    
    UILabel * dateLabel = [UILabel new];
    dateLabel.text = @"2018-09-09";
    dateLabel.font = kFONT17;
    [headerView addSubview:dateLabel];
    
    [dateLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 20, 10, 20) excludingEdge:ALEdgeRight];
    
    UIImageView * moreImg = [UIImageView new];
    moreImg.image = IMAGE(@"return");
    if ([self.stateArray[section] boolValue]) {
        moreImg.transform = CGAffineTransformRotate(moreImg.transform, M_PI_2);
    }else{
        moreImg.transform = CGAffineTransformRotate(moreImg.transform, -M_PI_2);
    }
    [headerView addSubview:moreImg];
    
    [moreImg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    [moreImg autoAlignAxis:ALAxisHorizontal toSameAxisOfView:dateLabel];
    
    UILabel * numLabel = [UILabel new];
    numLabel.text = @"10条笔记";
    numLabel.font = kFONT17;
    [headerView addSubview:numLabel];
    
    [numLabel autoPinEdge:ALEdgeRight toEdge:ALEdgeLeft ofView:moreImg withOffset:-10];
    [numLabel autoAlignAxis:ALAxisHorizontal toSameAxisOfView:dateLabel];
    
    return headerView;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * footView = [UIView new];
    
    UIView * line = [UIView new];
    line.backgroundColor = ATGray;
    [footView addSubview:line];
    
    [line autoSetDimension:ALDimensionHeight toSize:0.5];
    [line autoAlignAxisToSuperviewAxis:ALAxisHorizontal];
    [line autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    [line autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    return footView;
}

@end
