//
//  ATAnswerBtnBottomTool.m
//  AiTiTi
//
//  Created by LA on 2018/6/7.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATAnswerBtnBottomTool.h"

@interface ATAnswerBtnBottomTool ()
@property (weak, nonatomic) IBOutlet UIView *tagBgView;
@property (nonatomic, strong) UIButton *lastTagBtn;
@property (nonatomic, strong) NSMutableArray *tagBtnArray;
@end

@implementation ATAnswerBtnBottomTool

- (IBAction)nextAnstwerBtn:(UIButton *)sender {
    if (self.nextAnswerBtnBlock) {
        self.nextAnswerBtnBlock(sender,self.lastTagBtn.tag);
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat tagBtnW = 35;
    CGFloat tagBtnMargin = (self.tagBgView.width - 48 - tagBtnW * 4)/3;
    for (int i = 0; i < 4; i++) {
        NSArray *tagTitleArr = @[@"A",@"B",@"C",@"D"];
        UIButton *tagBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        tagBtn.frame = CGRectMake(24 + i * (tagBtnW + tagBtnMargin), 7, tagBtnW, tagBtnW);
        ViewBorderRadius(tagBtn, 35/2, 1, [UIColor blackColor]);
        tagBtn.tag = i;
        tagBtn.selected = NO;
        [tagBtn setTitle:tagTitleArr[i] forState:UIControlStateNormal];
        [tagBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tagBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [tagBtn addTarget:self action:@selector(tagBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.tagBgView addSubview:tagBtn];
        [self.tagBtnArray addObject:tagBtn];
    }
    
}

- (void)tagBtnClick:(UIButton *)tagBtn {
    if (self.lastTagBtn == tagBtn) {
        return;
    }
    tagBtn.selected = YES;
    self.lastTagBtn.selected = NO;
    self.lastTagBtn = tagBtn;
    for (int i = 0; i< self.tagBtnArray.count; i++) {
        UIButton *tempBtn = (UIButton *)self.tagBtnArray[i];
        if (i == tagBtn.tag) {
            tempBtn.selected = YES;
            [tempBtn setBackgroundColor:RGB(45, 180, 255)];
        }else {
            tempBtn.selected = NO;
            [tempBtn setBackgroundColor:[UIColor whiteColor]];
        }
    }
    
}

- (NSMutableArray *)tagBtnArray {
    if (!_tagBtnArray) {
        _tagBtnArray = [NSMutableArray array];
    }
    return _tagBtnArray;
}

@end
