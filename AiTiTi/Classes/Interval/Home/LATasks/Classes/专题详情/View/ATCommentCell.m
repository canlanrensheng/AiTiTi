//
//  ATCommentCell.m
//  AiTiTi
//
//  Created by LA on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATCommentCell.h"
NSString * const kATCommentCell = @"ATCommentCell";

@implementation ATCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)getTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    [tableView registerNibCell:[ATCommentCell class]];
    return [tableView dequeueReusableCellWithIdentifier:kATCommentCell forIndexPath:indexPath];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
