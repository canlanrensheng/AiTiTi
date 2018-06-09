//
//  ATTextFieldBottomTool.m
//  AiTiTi
//
//  Created by LA on 2018/6/4.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATTextFieldBottomTool.h"
@interface ATTextFieldBottomTool ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textTF;

@end

@implementation ATTextFieldBottomTool

- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 1)];
    self.textTF.leftView = leftView;
    self.textTF.leftViewMode = UITextFieldViewModeAlways;
    self.textTF.delegate = self;
}

- (IBAction)releaseBtn:(UIButton *)sender {
    if (self.releaseBtnBlock) {
        self.releaseBtnBlock(self.textTF.text);
    }
    [self.textTF resignFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [textField resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
