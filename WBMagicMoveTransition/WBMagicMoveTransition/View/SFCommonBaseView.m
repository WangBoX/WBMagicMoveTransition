//
//  SFCommonBaseView.m
//  ZJHJ-C
//
//  Created by 蔡龙君 on 2017/9/20.
//  Copyright © 2017年 zhongjinghuijin. All rights reserved.
//

#import "SFCommonBaseView.h"

@implementation SFCommonBaseView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initialize];
}

- (void)initialize {
    
}
@end
