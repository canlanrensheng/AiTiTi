//
//  ATDirectoryCell.m
//  AiTiTi
//
//  Created by LA on 2018/5/28.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATDirectoryCell.h"
NSString * const kATDirectoryCell = @"ATDirectoryCell";
@interface ATDirectoryCell ()
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ATDirectoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
}
- (void)setIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    self.numLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
}

+ (instancetype)getTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    [tableView registerNibCell:[ATDirectoryCell class]];
    return [tableView dequeueReusableCellWithIdentifier:kATDirectoryCell forIndexPath:indexPath];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
