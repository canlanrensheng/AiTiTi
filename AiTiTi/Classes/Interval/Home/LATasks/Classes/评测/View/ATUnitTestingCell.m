//
//  ATUnitTestingCell.m
//  AiTiTi
//
//  Created by LA on 2018/6/6.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATUnitTestingCell.h"
#import "ATUnitTestingModel.h"
NSString * const kATUnitTestingCell = @"ATUnitTestingCell";
@interface ATUnitTestingCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *selectImageV;

@end

@implementation ATUnitTestingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;

}

- (void)setModel:(ATUnitTestingModel *)model {
    _model = model;
    self.selectImageV.image = model.isSelect ? [UIImage imageNamed:@"circle_select_icon"] : [UIImage imageNamed:@"circle_default_cion"];
    
    self.titleLabel.text = SAFE_STR(model.title);
}

+ (instancetype)getTableView:(UITableView *)tableView forIndexPath:(NSIndexPath *)indexPath {
    [tableView registerNibCell:[ATUnitTestingCell class]];
    return [tableView dequeueReusableCellWithIdentifier:kATUnitTestingCell forIndexPath:indexPath];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
