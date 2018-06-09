//
//  ATSubjectListDetailCell.m
//  AiTiTi
//
//  Created by LA on 2018/6/7.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSubjectListDetailCell.h"
NSString * const kATSubjectListDetailCell = @"ATSubjectListDetailCell";

@implementation ATSubjectListDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)getTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    [tableView registerNibCell:[ATSubjectListDetailCell class]];
    return [tableView dequeueReusableCellWithIdentifier:kATSubjectListDetailCell forIndexPath:indexPath];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
