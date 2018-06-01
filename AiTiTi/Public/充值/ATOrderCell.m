//
//  ATOrderCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/5/23.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATOrderCell.h"

@implementation ATOrderCell

+ (instancetype)orderTableViewCellWith:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"";//对应xib中设置的identifier
    NSInteger index = 0; //xib中第几个Cell
    switch (indexPath.row) {
        case 0:
            identifier = @"orderfirst";
            index = 0;
            break;
        case 1:
            identifier = @"ordersecond";
            index = 1;
            break;
        case 2:
            identifier = @"orderthird";
            index = 2;
            break;
        case 3:
            identifier = @"orderffourth";
            index = 3;
            break;
        case 4:
            identifier = @"orderfifth";
            index = 4;
            break;
        case 5:
            identifier = @"ordersixth";
            index = 5;
            break;
        case 6:
            identifier = @"orderseventh";
            index = 6;
            break;
        case 7:
            identifier = @"ordereighth";
            index = 7;
            break;
        case 8:
            identifier = @"orderninth";
            index = 8;
            break;
            
        default:
            break;
    }
    ATOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ATOrderCell" owner:self options:nil] objectAtIndex:index];
    }
    return cell;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
