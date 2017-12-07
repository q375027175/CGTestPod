//
//  CGViewController.m
//  CGTestPod
//
//  Created by q375027175 on 11/30/2017.
//  Copyright (c) 2017 q375027175. All rights reserved.
//

#import "CGViewController.h"
#import "UITableView+CGNoneData.h"

@interface CGViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation CGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"cell for row %zd", indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.dataArr removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _tableView.rowHeight = 44;
        _tableView.tableFooterView = [[UIView alloc] init];
        
        [_tableView setShowMessage:@"暂无数据"];
        
        __weak CGViewController *weakSelf = self;
        [_tableView setShowNoDataViewCompara:^BOOL{
            return weakSelf.dataArr.count?NO:YES;
        }];
    }
    return _tableView;
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
        [_dataArr addObject:@""];
    }
    return _dataArr;
}

@end
