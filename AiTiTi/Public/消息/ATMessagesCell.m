//
//  ATMessagesCell.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/24.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMessagesCell.h"

@implementation ATMessagesCell

-(void)setModel:(ATMessagesModel *)model{
    _model = model;
    self.timeLabel.text = model.date;
    self.messagesLabel.text = model.content;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self makeSubViews];
    }
    return self;
}

-(void)makeSubViews{
    self.timeLabel = [UILabel new];
    self.timeLabel.font = kFONT12;
    self.timeLabel.textColor = [UIColor grayColor];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.timeLabel];
    
    [self.timeLabel autoPinEdgeToSuperviewEdge:ALEdgeTop withInset:5];
    [self.timeLabel autoAlignAxisToSuperviewAxis:ALAxisVertical];
    
    self.headImg = [UIImageView new];
    self.headImg.image = IMAGE(@"message_logo");
    [self.contentView addSubview:self.headImg];
    
    [self.headImg autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.timeLabel withOffset:5];
    [self.headImg autoPinEdgeToSuperviewEdge:ALEdgeLeft withInset:20];
    
    UIImage * bgImg = IMAGE(@"message_bg");
    bgImg = [bgImg resizableImageWithCapInsets:UIEdgeInsetsMake(30, 30, 10, 10)];
    UIImageView * messagesBg = [UIImageView new];
    messagesBg.image = bgImg;
    [self.contentView addSubview:messagesBg];
    
    [messagesBg autoPinEdge:ALEdgeLeft toEdge:ALEdgeRight ofView:self.headImg withOffset:10];
    [messagesBg autoPinEdge:ALEdgeTop toEdge:ALEdgeTop ofView:self.headImg withOffset:0];
    [messagesBg autoPinEdgeToSuperviewEdge:ALEdgeRight withInset:20];
    
    self.messagesLabel = [UILabel new];
    self.messagesLabel.font = kFONT13;
    self.messagesLabel.numberOfLines = 0;
    [messagesBg addSubview:self.messagesLabel];
    
    [self.messagesLabel autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 30, 10, 10) excludingEdge:ALEdgeBottom];
    
    UILabel * moreLabel = [UILabel new];
    [moreLabel addJXTouch:^{
        if (self.moreBlock) {
            self.moreBlock(self.model);
        }
    }];
    moreLabel.text = @"点击查看 >>";
    moreLabel.font = kFONT13;
    moreLabel.textColor = RGB(82, 170, 228);
    [messagesBg addSubview:moreLabel];
    
    [moreLabel autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:self.messagesLabel withOffset:5];
    [moreLabel autoPinEdge:ALEdgeLeft toEdge:ALEdgeLeft ofView:self.messagesLabel withOffset:0];
    
    //这个其实没什么用处 拿来适应自动高度的
    UIView * lineView = [UIView new];
    lineView.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:lineView];
    
    [lineView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsMake(10, 10, 10, 10) excludingEdge:ALEdgeTop];
    [lineView autoPinEdge:ALEdgeTop toEdge:ALEdgeBottom ofView:moreLabel withOffset:10];
    
    [messagesBg autoPinEdge:ALEdgeBottom toEdge:ALEdgeBottom ofView:lineView withOffset:0];
    
    self.timeLabel.text = @"2018年4月24日 14:00";
    self.messagesLabel.text = @"哈哈哈哈哈哈哈哈哈哈反反复复反反复复反反复复是生生世世生生世世生生世世哥哥哥哥哥哥哥哥哥哥哥哥哥哥看坎坎坷坷坎坎坷坷呜呜呜呜呜呜呜呜呜";
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
