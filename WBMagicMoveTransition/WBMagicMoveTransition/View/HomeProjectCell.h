//
//  HomeProjectCell.h
//  ZJHJ-C
//
//  Created by WBO on 2017/10/15.
//  Copyright © 2017年 zhongjinghuijin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeProjectCell : UITableViewCell
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *titleL;
@property (nonatomic, strong) UILabel *detailL;
@property (nonatomic, strong) UILabel *addressL;
@property (nonatomic, strong) UIView *partV;
@property (nonatomic, strong) UILabel *meritL;

@end

FOUNDATION_EXPORT NSString *const ProjectListCellID;
