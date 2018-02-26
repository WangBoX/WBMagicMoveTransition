//
//  TransitionViewController.m
//  WBMagicMoveTransition
//
//  Created by 王博Bling on 2018/2/26.
//  Copyright © 2018年 王博. All rights reserved.
//

#import "TransitionViewController.h"
#import "ViewController.h"
#import "WBMagicMoveInverseTransition.h"

@interface TransitionViewController ()<UINavigationControllerDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percentDrivenTransition;
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation TransitionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"项目主页";
    self.navigationController.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    self.tableView.tableHeaderView = self.headerView;
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.backgroundColor = [UIColor colorWithWhite:0.15 alpha:0.1];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01f;
}

- (ZJEnterpriseViewHeader *)headerView {
    if (!_headerView) {
        _headerView = [[ZJEnterpriseViewHeader alloc] init];
    }
    return _headerView;
}
#pragma mark <UINavigationControllerDelegate>
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC{
    if ([toVC isKindOfClass:[ViewController class]] && [fromVC isKindOfClass:[TransitionViewController class]]) {
        WBMagicMoveInverseTransition *transetion = [[WBMagicMoveInverseTransition alloc] init];
        return transetion;
    }else{
        return nil;
    }
}

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    if ([animationController isKindOfClass:[WBMagicMoveInverseTransition class]]) {
        return self.percentDrivenTransition;
    }else{
        return nil;
    }
}
@end
