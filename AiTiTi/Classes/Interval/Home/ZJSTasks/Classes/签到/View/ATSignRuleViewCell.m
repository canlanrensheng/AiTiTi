//
//  ATSignRuleViewCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATSignRuleViewCell.h"

@implementation ATSignRuleViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setLabelSpace:self.signTextPageLabel withValue:@"签到礼包活动一个自然月为一个周期，连续7天、14天、12天，满勤，可领取不同额度的礼包(包含补签天数)；" withFont:[UIFont systemFontOfSize:12]];
    [self setLabelSpace:self.signTextShareLabel withValue:@"分享签到到朋友圈可获得前1天的补签机会，每天仅有一次；" withFont:[UIFont systemFontOfSize:12]];
    [self setLabelSpace:self.signTextMoneyLabel withValue:@"签到所得金额可用于购买爱提提的服务，但不支持提现。" withFont:[UIFont systemFontOfSize:12]];
}


-(void)setLabelSpace:(UILabel*)label withValue:(NSString*)str withFont:(UIFont*)font {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 5; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.5f
                          };
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:str attributes:dic];
    label.attributedText = attributeStr;
}

@end
