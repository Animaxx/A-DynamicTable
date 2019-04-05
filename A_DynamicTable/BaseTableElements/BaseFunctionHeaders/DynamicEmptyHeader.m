//
//  DynamicEmptyHeader.m
//  A_DynamicTable
//
//  Created by Animax Deng on 2/12/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "DynamicEmptyHeader.h"

@implementation DynamicEmptyHeader

- (CGFloat)dynamicHeaderHeight {
    return 0.0;
}
- (UIView *)dynamicHeaderView {
    return [[UIView alloc] init];
}
+ (instancetype)create {
    return [[DynamicEmptyHeader alloc] init];
}

@end
