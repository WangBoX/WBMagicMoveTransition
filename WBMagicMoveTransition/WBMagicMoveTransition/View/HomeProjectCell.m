//
//  HomeProjectCell.m
//  ZJHJ-C
//
//  Created by WBO on 2017/10/15.
//  Copyright © 2017年 zhongjinghuijin. All rights reserved.
//

#import "HomeProjectCell.h"
#import "UILabel+Common.h"
#import "Masonry.h"

#define DisPidding              12
#define kPidding                20.f

NSString *const ProjectListCellID = @"ProjectListCellID";


@implementation HomeProjectCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatUI];
        [self layoutUI];
    }
    return self;
}

- (void)creatUI{
    
    _icon = [[UIImageView alloc] init];
    _icon.image = [UIImage imageNamed:@"test"];
    _icon.contentMode = UIViewContentModeScaleAspectFill;
    _icon.layer.cornerRadius = 4;
    _icon.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _icon.layer.borderWidth = 0.5f;
    _icon.layer.masksToBounds = YES;
    [self.contentView addSubview:_icon];
    
    _titleL = [[UILabel alloc] init];
    
    _titleL.textColor = [UIColor blackColor];
    _titleL.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
    _titleL.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_titleL];

    _detailL = [[UILabel alloc] init];
    _detailL.textColor = [UIColor blackColor];
    _detailL.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
    _detailL.numberOfLines = 2;
    [self.contentView addSubview:_detailL];
    
    _addressL = [[UILabel alloc] init];
    _addressL.textColor = [UIColor blackColor];
    _addressL.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
    [self.contentView addSubview:_addressL];
    

    _partV = [[UIView alloc] init];
    _partV.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_partV];
    
    _meritL = [[UILabel alloc] init];
    _meritL.textColor = [UIColor lightGrayColor];
    _meritL.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
    _meritL.textAlignment = 0;
    [self.contentView addSubview:_meritL];
    
    _titleL.text = @"人工智能项目";
    _detailL.text = @"最火热的区块链项目";
    _addressL.text = @"杭州";
    _meritL.text = @"人工智能";
}

- (void)layoutUI{
    
    [_titleL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kPidding*2+100);
        make.top.equalTo(self.contentView.mas_top).offset(25);
        make.right.equalTo(self.contentView.mas_right).offset(-15);
    }];
    
    [_icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kPidding);
        make.top.equalTo(_titleL.mas_top);
        make.size.mas_equalTo(CGSizeMake(100, 100)).priorityHigh();
    }];
    
    [_detailL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleL.mas_left).offset(0);
        make.right.equalTo(self.contentView.mas_right).offset(-kPidding);
        make.top.equalTo(_titleL.mas_bottom).offset(DisPidding);
    }];
    
    [_addressL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_titleL.mas_left);
        make.top.equalTo(_detailL.mas_bottom).offset(DisPidding);
        make.width.lessThanOrEqualTo(@100);
    }];
    [_partV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView).offset(0);
        make.top.equalTo(_addressL.mas_bottom).offset(DisPidding);
        make.height.mas_equalTo(0.5);
    }];
    
    [_meritL mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(kPidding);
        make.right.equalTo(self.contentView.mas_right).offset(-kPidding);
        make.top.equalTo(_partV.mas_bottom).offset(0);
        make.height.mas_equalTo(46);
        make.bottom.equalTo(self.contentView);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
