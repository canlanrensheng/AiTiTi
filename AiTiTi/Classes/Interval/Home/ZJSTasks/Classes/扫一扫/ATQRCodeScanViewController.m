//
//  ATQRCodeViewController.m
//  AiTiTi
//
//  Created by 张金山 on 2018/5/26.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATQRCodeScanViewController.h"
#import "SGQRCode.h"
#import "UINavigationBar+Extention.h"
@interface ATQRCodeScanViewController () <SGQRCodeScanManagerDelegate, SGQRCodeAlbumManagerDelegate,ATNavigationBarDelegate>
@property (nonatomic, strong) SGQRCodeScanManager *manager;
@property (nonatomic, strong) SGQRCodeScanningView *scanningView;
@property (nonatomic, strong) UIButton *flashlightBtn;
@property (nonatomic, strong) UILabel *promptLabel;
@property (nonatomic,strong) UILabel *topTitle;
@property (nonatomic, strong) UIImageView *buttomView;

@property (nonatomic, strong) UIButton *flashView;
@property (nonatomic, assign) BOOL isSelectedFlashlightBtn;
@property (nonatomic, strong) UIView *bottomView;
@end

@implementation ATQRCodeScanViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar lt_reset];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.scanningView removeTimer];
    [self removeFlashlightBtn];
    [_manager cancelSampleBufferDelegate];
    self.navigationController.navigationBar.hidden = NO;
}

- (void)dealloc {
    NSLog(@"WCQRCodeScanningVC - dealloc");
    [self removeScanningView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.view.backgroundColor = [UIColor clearColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.scanningView];
    [self setupNavigationBar];
    [self setupQRCodeScanning];
    [self drawTitle];
    [self drawButtomView];
    [self drawFlash];
    
}

- (void)setupNavigationBar {
    ATNavigationBar *navBar = [[ATNavigationBar alloc] initWithTitle:@"扫一扫" leftName:nil rightName:nil delegate:self];
    [navBar.leftBtn setImage:IMAGE(@"返回") forState:UIControlStateNormal];
    navBar.backgroundColor = [UIColor clearColor];
    navBar.titleLabel.textColor = [UIColor whiteColor];
    [navBar.leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (SGQRCodeScanningView *)scanningView {
    if (!_scanningView) {
        _scanningView = [[SGQRCodeScanningView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.9 * self.view.frame.size.height)];
        _scanningView.cornerColor = [UIColor colorWithRed:235./255. green:96./255. blue:88./255. alpha:1.0];
        
        //是否显示扫码框
        _scanningView.scanningImageName = @"QRCode_line";
        //扫码框颜色
        _scanningView.cornerColor = [UIColor colorWithRed:235./255. green:96./255. blue:88./255. alpha:1.0];
    }
    return _scanningView;
}
- (void)removeScanningView {
    [self.scanningView removeTimer];
    [self.scanningView removeFromSuperview];
    self.scanningView = nil;
}

- (void)rightBarButtonItenAction {
    SGQRCodeAlbumManager *manager = [SGQRCodeAlbumManager sharedManager];
    [manager readQRCodeFromAlbumWithCurrentController:self];
    manager.delegate = self;
    
    if (manager.isPHAuthorization == YES) {
        [self.scanningView removeTimer];
    }
}

- (void)setupQRCodeScanning {
    self.manager = [SGQRCodeScanManager sharedManager];
    NSArray *arr = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
    // AVCaptureSessionPreset1920x1080 推荐使用，对于小型的二维码读取率较高
    [_manager setupSessionPreset:AVCaptureSessionPreset1920x1080 metadataObjectTypes:arr currentController:self];
    _manager.delegate = self;
}

#pragma mark - - - SGQRCodeAlbumManagerDelegate
-(void)QRCodeAlbumManagerDidCancelWithImagePickerController:(SGQRCodeAlbumManager *)albumManager {
    [self.view addSubview:self.scanningView];
}
- (void)QRCodeAlbumManager:(SGQRCodeAlbumManager *)albumManager didFinishPickingMediaWithResult:(NSString *)result {
    if ([result hasPrefix:@"http"]) {
        //        ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
        //        jumpVC.comeFromVC = ScanSuccessJumpComeFromWC;
        //        jumpVC.jump_URL = result;
        //        [self.navigationController pushViewController:jumpVC animated:YES];
        
    } else {
        //        ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
        //        jumpVC.comeFromVC = ScanSuccessJumpComeFromWC;
        //        jumpVC.jump_bar_code = result;
        //        [self.navigationController pushViewController:jumpVC animated:YES];
    }
}
- (void)QRCodeAlbumManagerDidReadQRCodeFailure:(SGQRCodeAlbumManager *)albumManager {
    NSLog(@"暂未识别出二维码");
}

#pragma mark - - - SGQRCodeScanManagerDelegate
- (void)QRCodeScanManager:(SGQRCodeScanManager *)scanManager didOutputMetadataObjects:(NSArray *)metadataObjects {
    //    NSLog(@"metadataObjects - - %@", metadataObjects);
    if (metadataObjects != nil && metadataObjects.count > 0) {
        [scanManager playSoundName:@"SGQRCode.bundle/sound.caf"];
        [scanManager stopRunning];
        [scanManager videoPreviewLayerRemoveFromSuperlayer];
        
        //        AVMetadataMachineReadableCodeObject *obj = metadataObjects[0];
        //        ScanSuccessJumpVC *jumpVC = [[ScanSuccessJumpVC alloc] init];
        //        jumpVC.comeFromVC = ScanSuccessJumpComeFromWC;
        //        jumpVC.jump_URL = [obj stringValue];
        //        [self.navigationController pushViewController:jumpVC animated:YES];
    } else {
        NSLog(@"暂未识别出扫描的二维码");
    }
}
- (void)QRCodeScanManager:(SGQRCodeScanManager *)scanManager brightnessValue:(CGFloat)brightnessValue {
    //    if (brightnessValue < - 1) {
    //        [self.view addSubview:self.flashlightBtn];
    //    } else {
    //        if (self.isSelectedFlashlightBtn == NO) {
    //            [self removeFlashlightBtn];
    //        }
    //    }
}

- (UILabel *)promptLabel {
    if (!_promptLabel) {
        _promptLabel = [[UILabel alloc] init];
        _promptLabel.backgroundColor = [UIColor clearColor];
        CGFloat promptLabelX = 0;
        CGFloat promptLabelY = 0.73 * self.view.frame.size.height;
        CGFloat promptLabelW = self.view.frame.size.width;
        CGFloat promptLabelH = 25;
        _promptLabel.frame = CGRectMake(promptLabelX, promptLabelY, promptLabelW, promptLabelH);
        _promptLabel.textAlignment = NSTextAlignmentCenter;
        _promptLabel.font = [UIFont boldSystemFontOfSize:13.0];
        _promptLabel.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.6];
        _promptLabel.text = @"将二维码/条码放入框内, 即可自动扫描";
    }
    return _promptLabel;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.scanningView.frame), self.view.frame.size.width, self.view.frame.size.height - CGRectGetMaxY(self.scanningView.frame))];
        _bottomView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return _bottomView;
}

#pragma mark - - - 闪光灯按钮
- (UIButton *)flashlightBtn {
    if (!_flashlightBtn) {
        // 添加闪光灯按钮
        _flashlightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        CGFloat flashlightBtnW = 30;
        CGFloat flashlightBtnH = 30;
        CGFloat flashlightBtnX = 0.5 * (self.view.frame.size.width - flashlightBtnW);
        CGFloat flashlightBtnY = 0.55 * self.view.frame.size.height;
        _flashlightBtn.frame = CGRectMake(flashlightBtnX, flashlightBtnY, flashlightBtnW, flashlightBtnH);
        [_flashlightBtn setBackgroundImage:[UIImage imageNamed:@"SGQRCodeFlashlightOpenImage"] forState:(UIControlStateNormal)];
        [_flashlightBtn setBackgroundImage:[UIImage imageNamed:@"SGQRCodeFlashlightCloseImage"] forState:(UIControlStateSelected)];
        [_flashlightBtn addTarget:self action:@selector(flashlightBtn_action:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _flashlightBtn;
}

- (void)flashlightBtn_action:(UIButton *)button {
    if (button.selected == NO) {
        [SGQRCodeHelperTool SG_openFlashlight];
        //        self.isSelectedFlashlightBtn = YES;
        //        button.selected = YES;
    } else {
        [SGQRCodeHelperTool SG_CloseFlashlight];
    }
    button.selected = !button.selected;
}

- (void)removeFlashlightBtn {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SGQRCodeHelperTool SG_CloseFlashlight];
        //        self.isSelectedFlashlightBtn = NO;
        //        self.flashlightBtn.selected = NO;
        //        [self.flashlightBtn removeFromSuperview];
    });
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
        _flashView = [UIButton buttonWithType:UIButtonTypeCustom];
        [_flashView setImage:IMAGE(@"QRCode_flashlight") forState:UIControlStateNormal];
        [self.view addSubview:_flashView];
        [_flashView addTarget:self action:@selector(flashlightBtn_action:) forControlEvents:UIControlEventTouchUpInside];
        [_flashView autoAlignAxisToSuperviewAxis:ALAxisVertical];
        [_flashView autoPinEdge:ALEdgeBottom toEdge:ALEdgeTop ofView:_buttomView withOffset:-50];
    }
}



@end
