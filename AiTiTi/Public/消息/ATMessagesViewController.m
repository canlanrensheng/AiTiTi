//
//  ATMessagesViewController.m
//  AiTiTi
//
//  Created by 李云辉 on 2018/4/24.
//  Copyright © 2018年 云辉. All rights reserved.
//

#import "ATMessagesViewController.h"
#import "ATMessagesCell.h"

@interface ATMessagesViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataArray;

@end

@implementation ATMessagesViewController

-(NSMutableArray *)dataArray{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark - system
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
    
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStyleDone target:self action:@selector(editAction)];
    self.navigationItem.rightBarButtonItem = editButton;
    [self.navigationItem.rightBarButtonItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:15],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    [self makeSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)makeSubViews{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 50;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:self.tableView];
    
    [self.tableView autoPinEdgesToSuperviewEdgesWithInsets:UIEdgeInsetsZero];
}

#pragma mark - tableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //如果有必须的固定高度，可以设置固定的，没有固定的，可以设置自适应高度
//    if (indexPath.row == 0) {
//        return 100;
//    } else {
        return UITableViewAutomaticDimension;
//    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *ID = @"messages";
    ATMessagesCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ATMessagesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.moreBlock = ^(ATMessagesModel *model) {
            //
        };
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.contentLabel.text = self.dataArray[indexPath.row];
    return cell;
}

#pragma mark - Action
-(void)editAction{
    //
}

@end
