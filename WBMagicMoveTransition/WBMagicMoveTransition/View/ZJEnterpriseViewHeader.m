//
//  ZJEnterpriseViewHeader.m
//  ZJHJ-C
//
//  Created by 蔡龙君 on 2017/10/16.
//  Copyright © 2017年 zhongjinghuijin. All rights reserved.
//

#import "ZJEnterpriseViewHeader.h"
#import "Masonry.h"


#define kPidding                     20.f

@interface ZJEnterpriseViewHeader()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *addressIconImageView;
@property (nonatomic, strong) UILabel *addressLabel;
@end
@implementation ZJEnterpriseViewHeader

- (void)initialize {
    self.backgroundColor = [UIColor whiteColor];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(kPidding);
        make.top.equalTo(self).offset(20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];

    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.iconImageView).offset(5);
        make.left.equalTo(self.iconImageView.mas_right).offset(kPidding);
        make.width.mas_equalTo(100);
    }];
    
    [self.addressIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(kPidding * 0.5);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(12);
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.addressIconImageView.mas_right).offset(kPidding * 0.5);
        make.centerY.equalTo(self.addressIconImageView);
    }];
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.width.mas_equalTo(200);
        make.top.equalTo(self.addressLabel.mas_bottom).offset(kPidding * 0.5);
    }];

}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] init];
        _iconImageView.image = [UIImage imageNamed:@"test"];
        _iconImageView.layer.cornerRadius = 4;
        _iconImageView.contentMode = UIViewContentModeScaleAspectFill;
        _iconImageView.layer.masksToBounds = YES;
        _iconImageView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _iconImageView.layer.borderWidth = 0.5f;
        [self addSubview:_iconImageView];
    }
    return _iconImageView;
}
- (UIImageView *)addressIconImageView {
    if (!_addressIconImageView) {
        _addressIconImageView = [[UIImageView alloc] init];
        _addressIconImageView.image = [UIImage imageNamed:@"home_map_icon"];
        [self addSubview:_addressIconImageView];
    }
    return _addressIconImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
        _titleLabel.numberOfLines = 0;
        _titleLabel.text = @"人工智能项目";
        [self addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = [UIColor blackColor];
        _detailLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
        _detailLabel.text = @"全新的互联网模式,自主的知识产权";
        [self addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.textColor = [UIColor blackColor];
        _addressLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
        _addressLabel.text = @"浙江杭州";
        [self addSubview:_addressLabel];
    }
    return _addressLabel;
}

@end
