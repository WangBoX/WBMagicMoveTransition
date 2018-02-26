//
//  ViewController.m
//  WBMagicMoveTransition
//
//  Created by 王博Bling on 2018/2/26.
//  Copyright © 2018年 王博. All rights reserved.
//

#import "ViewController.h"
#import "TransitionViewController.h"
#import "WBMagicMoveTransition.h"

@interface ViewController ()<UINavigationControllerDelegate,UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>


@end

@implementation ViewController
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.delegate = self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [_tableView registerClass:[HomeProjectCell class] forCellReuseIdentifier:ProjectListCellID];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    _tableView.estimatedRowHeight = 44;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = [[UIView alloc] init];
    _tableView.tableFooterView = [[UIView alloc] init];
}

#pragma mark --tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = 6;
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeProjectCell *cell = [tableView dequeueReusableCellWithIdentifier:ProjectListCellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.indexPath = indexPath;
    TransitionViewController *vc = [[TransitionViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat h = 0;
    return h;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}

#pragma mark <UINavigationControllerDelegate>
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[TransitionViewController class]] && [fromVC isKindOfClass:[ViewController class]]) {
        WBMagicMoveTransition *transetion = [[WBMagicMoveTransition alloc] init];
        return transetion;
    }else{
        return nil;
    }
}
@end
