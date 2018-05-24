//
//  ATQRCodeViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/18.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATQRCodeViewController.h"

@interface ATQRCodeViewController ()

@end

@implementation ATQRCodeViewController

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"扫一扫";
    
    self.style = [self DIY];
    self.isOpenInterestRect = YES;
    self.libraryType = SLT_Native;
    self.scanCodeType = SCT_QRCode;
    
    self.cameraInvokeMsg = @"相机启动中";
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self drawTitle];
    [self drawButtomView];
    [self drawFlash];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//绘制扫描区域
- (void)drawTitle{
    if (!_topTitle){
        self.topTitle = [[UILabel alloc]init];
        _topTitle.bounds = CGRectMake(0, 0, self.view.size.width, 60);
        _topTitle.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, 110);
        
        //3.5inch iphone
        if ([UIScreen mainScreen].bounds.size.height <= 568 ){
            _topTitle.center = CGPointMake(CGRectGetWidth(self.view.frame)/2, 72);
            _topTitle.font = [UIFont systemFontOfSize:14];
        }
        
        _topTitle.textAlignment = NSTextAlignmentCenter;
        _topTitle.text = @"扫描“名师精讲卷”上的二维码";
        _topTitle.font = kFONT16;
        _topTitle.textColor = [UIColor whiteColor];
        [self.view addSubview:_topTitle];
    }
}
//绘制底部视图
-(void)drawButtomView{
    if (!_buttomView) {
        self.buttomView = [UIImageView new];
        _buttomView.image = IMAGE(@"QRCode_buttom");
        [_buttomView addJXTouch:^{
            //
        }];
        [self.view addSubview:_buttomView];
        
        [_buttomView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero excludingEdge:ALEdgeTop];
    }
}
//绘制手电筒
-(void)drawFlash{
    if (!_flashView) {
        self.flashView = [UIImageView new];
        _flashView.image = IMAGE(@"QRCode_flashlight");
        __weak typeof(self)weakSelf = self;
        [_flashView addJXTouch:^{
            [weakSelf openOrCloseFlash];
        }];
        [self.view addSubview:_flashView];
        
        [_flashView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_flashView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_buttomView withOffset:-50];
    }
}
#pragma mark -实现类继承该方法，作出对应处理
- (void)scanResultWithArray:(NSArray<LBXScanResult*>*)array
{
    if (!array ||  array.count < 1){
        return;
    }
    
    LBXScanResult *scanResult = array[0];
    
    NSString*strResult = scanResult.strScanned;
    
    self.scanImage = scanResult.imgScanned;
    
    if (!strResult) {
        return;
    }
    NSLog(@"%@",strResult);
    [self reStartDevice];
    
    //TODO: 这里可以根据需要自行添加震动或播放声音提示相关代码
    //...
}

#pragma mark - 自定义
- (LBXScanViewStyle*)DIY
{
    //设置扫码区域参数
    LBXScanViewStyle *style = [[LBXScanViewStyle alloc]init];
    
    //扫码框中心位置与View中心位置上移偏移像素(一般扫码框在视图中心位置上方一点)
    style.centerUpOffset = 44;
    
    //扫码框周围4个角的类型设置为在框的上面,可自行修改查看效果
    style.photoframeAngleStyle = LBXScanViewPhotoframeAngleStyle_On;
    
    //扫码框周围4个角绘制线段宽度
    style.photoframeLineW = 4;
    
    //扫码框周围4个角水平长度
    style.photoframeAngleW = 26;
    
    //扫码框周围4个角垂直高度
    style.photoframeAngleH = 26;
    
    //动画类型
    style.anmiationStyle = LBXScanViewAnimationStyle_LineMove;
    
    //动画图片:网格图片
    style.animationImage = [UIImage imageNamed:@"QRCode_line"];;
    
    //扫码框周围4个角的颜色
    style.colorAngle = [UIColor colorWithRed:235./255. green:96./255. blue:88./255. alpha:1.0];
    
    //是否显示扫码框
    style.isNeedShowRetangle = YES;
    //扫码框颜色
    style.colorRetangleLine = [UIColor colorWithRed:255./255. green:255./255. blue:255./255. alpha:1.0];
    
    //非扫码框区域颜色(扫码框周围颜色，一般颜色略暗)
    //必须通过[UIColor colorWithRed: green: blue: alpha:]来创建，内部需要解析成RGBA
    style.notRecoginitonArea = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6];
    
    return style;
}
@end
