//
//  ATTestDirrectionCell.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/29.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTestDirrectionCell.h"
#import "ATTestDirectionItemCell.h"

static NSString *ATTestDirectionItemCellID = @"ATTestDirectionItemCell";
@interface ATTestDirrectionCell()<UITableViewDelegate,UITableViewDataSource>


@end

@implementation ATTestDirrectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backView.clipsToBounds = YES;
    self.backView.layer.cornerRadius = 5.0f;
    self.backView.layer.borderColor = RGBCOLOR(245, 176, 32).CGColor;
    self.backView.layer.borderWidth = 1.0f;
    
    self.testDirectionTableView.delegate = self;
    self.testDirectionTableView.dataSource = self;
    
    [self.testDirectionTableView registerNib:[UINib nibWithNibName:ATTestDirectionItemCellID bundle:nil] forCellReuseIdentifier:ATTestDirectionItemCellID];
    
    self.tableViewHeightCon.constant = 30 * 6;
    self.backViewHeightCon.constant = 30 * 6 + 18 + 8;
    
    [self.testDirectionTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATTestDirectionItemCell * cell = [tableView dequeueReusableCellWithIdentifier:ATTestDirectionItemCellID];
    self.testDirectionTableView.separatorColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    [cell setViewModel:self.viewModel indexPath:indexPath];
    return cell;
}

@end
