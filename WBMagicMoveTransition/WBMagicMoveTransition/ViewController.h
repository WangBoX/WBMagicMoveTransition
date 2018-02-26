//
//  ViewController.h
//  WBMagicMoveTransition
//
//  Created by 王博Bling on 2018/2/26.
//  Copyright © 2018年 王博. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeProjectCell.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) UITableView *tableView;
//神奇转场特效，接口需要
@property(nonatomic,strong)NSIndexPath *indexPath;
@property(nonatomic,assign)CGRect finalCellRect;


@end

