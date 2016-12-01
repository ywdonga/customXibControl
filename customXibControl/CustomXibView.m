//
//  CustomXibView.m
//  customXibControl
//
//  Created by dyw on 16/12/1.
//  Copyright © 2016年 dyw. All rights reserved.
//

#import "CustomXibView.h"

@implementation CustomXibView

/**
 XIB创建会掉用
 */
- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUI];
    }
    return self;
}

/**
 代码创建会掉用
 */
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

/**
 初始化
 */
- (void)setUI{
    [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    [self addSubview:self.view];
}

/**
 自动适配大小
 */
- (void)drawRect:(CGRect)rect{
    self.view.frame = self.bounds;
}

@end
