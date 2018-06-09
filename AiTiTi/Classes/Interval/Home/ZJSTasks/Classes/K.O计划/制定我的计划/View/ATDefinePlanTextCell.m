//
//  ATDefinePlanTextCell.m
//  AiTiTi
//
//  Created by 张金山 on 2018/6/3.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATDefinePlanTextCell.h"
#import "ATDefinePlanViewModel.h"
@implementation ATDefinePlanTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.textField.layer.borderColor = [[UIColor colorWithRed:229.0f/255.0f green:229.0f/255.0f blue:229.0f/255.0f alpha:1.0f] CGColor];
    self.textField.layer.borderWidth = 0.5;
    self.textField.layer.backgroundColor = [[UIColor colorWithRed:255.0f/255.0f green:255.0f/255.0f blue:255.0f/255.0f alpha:1.0f] CGColor];
    self.textField.layer.cornerRadius = 5.0f;
    self.textField.alpha = 1;
    
    UIView * leftPhoneView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 44)];
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.leftView = leftPhoneView;
    
    
}

- (void)setViewModel:(BaseViewModel *)viewModel indexPath:(NSIndexPath *)indexPath{
    ATDefinePlanViewModel *listViewModel = (ATDefinePlanViewModel *)viewModel;
    if(indexPath.row == 0){
        self.textField.placeholder = @"请输入计划名称";
        self.openButton.hidden = YES;
    }else if (indexPath.row == 1){
        self.textField.placeholder = @"请选择科目";
        self.openButton.hidden = NO;
    }else{
        self.textField.placeholder = @"请输入描述";
        self.openButton.hidden = YES;
    }
}

@end
