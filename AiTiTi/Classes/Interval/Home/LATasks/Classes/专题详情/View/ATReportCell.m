


//
//  ATReportCell.m
//  AiTiTi
//
//  Created by LA on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATReportCell.h"
NSString * const kATReportCell = @"ATReportCell";
@interface ATReportCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *selectImageV;

@end

@implementation ATReportCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+ (instancetype)getTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    [tableView registerNibCell:[ATReportCell class]];
    return [tableView dequeueReusableCellWithIdentifier:kATReportCell forIndexPath:indexPath];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
