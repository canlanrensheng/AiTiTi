//
//  JPullDownMenu.m
//  JPullDownMenuDemo
//
//  Created by 开发者 on 16/5/19.
//  Copyright © 2016年 jinxiansen. All rights reserved.
//

#import "JPullDownMenu.h"
#import <objc/runtime.h>
#import "ATSelectGradeBtn.h"
#import "ATPullDownCell.h"
#define Kscreen_width  [UIScreen mainScreen].bounds.size.width
#define Kscreen_height [UIScreen mainScreen].bounds.size.height
#define KTitleButtonHeight 50

// 格式 0xff3737
#define RGBHexAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define KDefaultColor RGBHexAlpha(0x189cfb, 1)

#define KmaskBackGroundViewColor  [UIColor colorWithRed:40/255 green:40/255 blue:40/255 alpha:.2]
#define kCellBgColor [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:.7]

#define KTableViewCellHeight 50

#define KDisplayMaxCellOfNumber  5

#define KTitleButtonTag 1000


#define KOBJCSetObject(object,value)  objc_setAssociatedObject(object,@"title" , value, OBJC_ASSOCIATION_RETAIN_NONATOMIC)

#define KOBJCGetObject(object) objc_getAssociatedObject(object, @"title")

@interface JPullDownMenu () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic) NSArray *titleArray ;

@property (nonatomic)UITableView *tableView;
@property (nonatomic)NSMutableArray *tableDataArray;

@property (nonatomic) CGFloat selfOriginalHeight ;
@property (nonatomic) CGFloat tableViewMaxHeight ;

@property (nonatomic) NSMutableArray *buttonArray;

@property (nonatomic) UIView  *maskBackGroundView;

@end

@implementation JPullDownMenu


- (instancetype)initWithFrame:(CGRect)frame menuTitleArray:(NSArray *)titleArray{
    self = [super initWithFrame:frame];
    if (self) {
        self.tableViewMaxHeight = KTableViewCellHeight * KDisplayMaxCellOfNumber;
        self.selfOriginalHeight = frame.size.height;
        self.titleArray =titleArray;
        
        [self addSubview:self.maskBackGroundView];
        [self addSubview:self.tableView];
        
        [self configBaseInfo];
    }
    return self;
}

- (void)configBaseInfo{
    //用于遮盖self.backgroundColor 。
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, Kscreen_width, KTitleButtonHeight)];
    view.backgroundColor=[UIColor whiteColor];
    [self addSubview:view];
    
    CGFloat width = (Kscreen_width - 22 * 2 - (self.titleArray.count - 1) * 22) /self.titleArray.count;
    
    for (int index=0; index < self.titleArray.count; index++) {
        
        UIView *buttonbankView = [[UIView alloc] init];
        buttonbankView.frame = CGRectMake((width + 22) * index + 22, 0, width, KTitleButtonHeight);
        [buttonbankView setBackgroundColor:[UIColor whiteColor]];
        [self addSubview:buttonbankView];
        
        UIButton *titleButton=[UIButton buttonWithType:UIButtonTypeCustom];
//        CGFloat titleButtonWidth = width-20;
        titleButton.frame= CGRectMake(0, 10, width, KTitleButtonHeight - 20);
        titleButton.layer.cornerRadius = 5.0f;
        titleButton.clipsToBounds = YES;
        titleButton.layer.borderColor = RGB(153, 153, 153).CGColor;
        titleButton.layer.borderWidth = 1.0;
        titleButton.backgroundColor = [UIColor whiteColor];
        [titleButton setTitle:self.titleArray[index] forState:UIControlStateNormal];
        [titleButton setTitleColor:RGB(51, 51, 51) forState:UIControlStateNormal];
        titleButton.tag =KTitleButtonTag + index ;
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        titleButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [titleButton setTitleColor:DEFAULTCOLOR forState:UIControlStateSelected];
        [titleButton setImage:[UIImage imageNamed:@"subject_black_arrow_down"] forState:UIControlStateNormal];
        
        //设置按钮坐文字右图片
//        titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0);
        titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, -(titleButton.imageView.bounds.size.width+8), 0, titleButton.imageView.bounds.size.width);
        titleButton.imageEdgeInsets = UIEdgeInsetsMake(0, titleButton.titleLabel.bounds.size.width, 0, -titleButton.titleLabel.bounds.size.width);
        
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(buttonbankView.frame) - 1, self.bounds.size.width, 1)];
        lineView.backgroundColor = RGB(240, 240, 240);
        [buttonbankView addSubview:titleButton];
        [buttonbankView addSubview:lineView];
        [self.buttonArray addObject:titleButton];
        
    }
    
}

- (UITableView *)tableView{
    if (_tableView) {
        return _tableView;
    }
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, self.frame.size.height, Kscreen_width, 0)];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.tableView.backgroundColor= [UIColor whiteColor];
    self.tableView.scrollEnabled = NO;
    self.tableView.rowHeight= KTableViewCellHeight;
    
    [self.tableView registerNibCell:[ATPullDownCell class]];
    return self.tableView;
}


#pragma mark  --  <代理方法>
#pragma mark  --  <UITableViewDelegate,UITableViewDataSource>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tableDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATPullDownCell *cell =[tableView dequeueReusableCellWithIdentifier:@"ATPullDownCell" forIndexPath:indexPath];
    NSDictionary *dataDict = self.tableDataArray[indexPath.row];
    cell.itemTitleLabel.text = dataDict[@"title"];
    if([dataDict[@"image"] length] > 0){
        cell.vipImageView.image = IMAGE(dataDict[@"image"]);
        cell.vipImageView.hidden = NO;
    }else{
        cell.vipImageView.hidden = YES;
    }
    
    self.tableView.separatorColor = RGB(228, 228, 228);
    NSString *objcTitle = KOBJCGetObject(self.tempButton);
    if ([cell.itemTitleLabel.text isEqualToString:objcTitle]) {
        cell.isSelected = YES;
    }else{
        cell.isSelected = NO;
    }
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ATPullDownCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.isSelected = YES;
    [self.tempButton setTitle:cell.itemTitleLabel.text forState:UIControlStateNormal];
    KOBJCSetObject(self.tempButton, cell.itemTitleLabel.text);
    if (self.handleSelectDataBlock) {
        self.handleSelectDataBlock(cell.itemTitleLabel.text,indexPath.row,self.tempButton.tag - KTitleButtonTag);
    }
    [self takeBackTableView];
    self.tempButton.titleEdgeInsets = UIEdgeInsetsMake(0, -(self.tempButton.imageView.bounds.size.width+8), 0, self.tempButton.imageView.bounds.size.width);
    self.tempButton.imageEdgeInsets = UIEdgeInsetsMake(0, self.tempButton.titleLabel.bounds.size.width, 0, -self.tempButton.titleLabel.bounds.size.width);
}

- (void)setDefauldSelectedCell{
    for (int index=0; index<self.buttonArray.count; index++) {
        self.tableDataArray =self.menuDataArray[index];
        UIButton *button =self.buttonArray[index];
        NSDictionary *dataDict = self.tableDataArray[0];
//        cell.itemTitleLabel.text = dataDict[@"title"];
//        NSString *title = self.tableDataArray.firstObject;
        NSString *title = dataDict[@"title"];
        KOBJCSetObject(button, title);
        [button setTitle:title forState:UIControlStateNormal];
    }
    [self takeBackTableView];
}


- (void)titleButtonClick:(UIButton *)titleButton{
    NSUInteger index =  titleButton.tag - KTitleButtonTag;
    for (UIButton *button in self.buttonArray) {
        if (button == titleButton) {
            button.selected=!button.selected;
            self.tempButton =button;
            [self changeButtonObject:button TransformAngle:M_PI];
        }else{
            button.selected=NO;
            [self changeButtonObject:button TransformAngle:0];
        }
    }
    if (titleButton.selected) {
       [self changeButtonObject:titleButton TransformAngle:M_PI];
        self.tableDataArray = self.menuDataArray[index];
        //设置默认选中第一项。
        if ([KOBJCGetObject(self.tempButton) length]<1) {
            
//            NSString *title = self.tableDataArray.firstObject;
            
            NSDictionary *dataDict = self.tableDataArray[0];
            NSString *title = dataDict[@"title"];
            KOBJCSetObject(self.tempButton, title);
        }
        [self.tableView reloadData];
        CGFloat tableViewHeight =  self.tableDataArray.count * KTableViewCellHeight < self.tableViewMaxHeight ?
        self.tableDataArray.count * KTableViewCellHeight : self.tableViewMaxHeight;
        [self expandWithTableViewHeight:tableViewHeight];
        
    }else{
        [self takeBackTableView];
    }
    
    self.tempButton.titleEdgeInsets = UIEdgeInsetsMake(0, -(self.tempButton.imageView.bounds.size.width+8), 0, self.tempButton.imageView.bounds.size.width);
    self.tempButton.imageEdgeInsets = UIEdgeInsetsMake(0, self.tempButton.titleLabel.bounds.size.width, 0, -self.tempButton.titleLabel.bounds.size.width);
}

//展开。
-(void)expandWithTableViewHeight:(CGFloat )tableViewHeight{
    self.maskBackGroundView.hidden=NO;
    CGRect rect = self.frame;
    rect.size.height = Kscreen_height - self.frame.origin.y;
    self.frame= rect;
    [self showSpringAnimationWithDuration:0.3 animations:^{
        self.tableView.frame = CGRectMake(0, self.selfOriginalHeight, Kscreen_width, tableViewHeight);
        self.maskBackGroundView.alpha =1;
    } completion:^{
        
    }];
}

//收起。
- (void)takeBackTableView{
    for (UIButton *button in self.buttonArray) {
        button.selected = NO;
        [self changeButtonObject:button TransformAngle:0];
    }
    CGRect rect = self.frame;
    rect.size.height = self.selfOriginalHeight;
    self.frame = rect;
    [self showSpringAnimationWithDuration:.3 animations:^{
        self.tableView.frame = CGRectMake(0, self.selfOriginalHeight, Kscreen_width,0);;
        self.maskBackGroundView.alpha =0;
    } completion:^{
        self.maskBackGroundView.hidden=YES;
    }];
}


- (void)changeButtonObject:(UIButton *)button TransformAngle:(CGFloat)angle{
    [UIView animateWithDuration:0.5 animations:^{
        button.imageView.transform =CGAffineTransformMakeRotation(angle);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showSpringAnimationWithDuration:(CGFloat)duration
                            animations:(void (^)())animations
                            completion:(void (^)())completion{
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:.8 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        if (animations) {
            animations();
        }
    } completion:^(BOOL finished) {
        if (completion) {
            completion();
        }
    }];
}

- (void)maskBackGroundViewTapClick{
    [self takeBackTableView];
}

- (NSMutableArray *)menuDataArray{
    if (_menuDataArray) {
        return _menuDataArray;
    }
    self.menuDataArray =[[NSMutableArray alloc]init];
    return self.menuDataArray;
}


- (NSMutableArray *)tableDataArray{
    if (_tableDataArray) {
        return _tableDataArray;
    }
    self.tableDataArray = [[NSMutableArray alloc]init];
    return self.tableDataArray;
}

- (NSMutableArray *)buttonArray{
    if (_buttonArray) {
        return _buttonArray;
    }
    self.buttonArray =[[NSMutableArray alloc]init];
    return self.buttonArray;
}

- (UIView *)maskBackGroundView{
    if (_maskBackGroundView) {
        return _maskBackGroundView;
    }
    self.maskBackGroundView=[[UIView alloc]initWithFrame:CGRectMake(0,0,self.frame.size.width, Kscreen_height - self.frame.origin.y)];
    self.maskBackGroundView.backgroundColor=KmaskBackGroundViewColor;
    self.maskBackGroundView.hidden=YES;
    self.maskBackGroundView.userInteractionEnabled=YES;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(maskBackGroundViewTapClick)];
    [self.maskBackGroundView addGestureRecognizer:tap];
    return self.maskBackGroundView;
}

@end

