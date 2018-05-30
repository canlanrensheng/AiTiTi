//
//  CheckOutListSectionHeaderView.h
//  ITelematics
//
//  Created by Oma-002 on 2018/4/17.
//  Copyright © 2018年 com.lima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CheckOutListSectionHeaderView : UITableViewHeaderFooterView
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
- (IBAction)selectButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *checkNameLabel;
@property (weak, nonatomic) IBOutlet UIButton *openButton;
- (IBAction)openButtonClick:(id)sender;

@property (nonatomic,strong) RACSubject *selectButtonSubject;
@property (nonatomic,strong) RACSubject *openButtonSubject;

@end
