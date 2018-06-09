//
//  ATStudyHeaderView.m
//  AiTiTi
//
//  Created by Oma-002 on 2018/5/30.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATStudyHeaderView.h"
#import "ATMyPlanStateViewController.h"
#import "ATStudyPlanCalenderAlertView.h"
@interface ATStudyHeaderView()

@property (nonatomic,strong) ATStudyPlanCalenderAlertView *alertView;

@end

@implementation ATStudyHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    [self.planButton clipWithCornerRadius:13.5 borderColor:ATWhite borderWidth:1.0];
    [self.createPlanButton clipWithCornerRadius:13.5 borderColor:ATWhite borderWidth:1.0];
    [self.startStudyButton clipWithCornerRadius:18 borderColor:ATWhite borderWidth:1.0];
}



- (IBAction)planButtonClick:(id)sender {
    [self.alertView showInView:VisibleViewController().view];
}

- (IBAction)createPlanButtonClick:(id)sender {
}

- (IBAction)satrtStudyButtonClick:(id)sender {
    ATMyPlanStateViewController *planStateVC = [[ATMyPlanStateViewController alloc] init];
    [VisibleViewController().navigationController pushViewController:planStateVC animated:YES];
}

- (ATStudyPlanCalenderAlertView *)alertView{
    if(!_alertView){
        _alertView = [[ATStudyPlanCalenderAlertView alloc] initWithFrame:CGRectMake(0,0, Screen_Width, Screen_Height) actionSheetBlock:^(NSString *dateString) {
            
            [self.alertView dismiss];
            _alertView = nil;
        } cancleSheetBlock:^{
            [self.alertView dismiss];
            _alertView = nil;
        }];
    }
    return _alertView;
}

@end
