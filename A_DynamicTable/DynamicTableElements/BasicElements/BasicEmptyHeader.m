//
//  BasicEmptyHeader.h
//  A_DynamicTable
//
//  Created by Animax Deng on 2/12/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "BasicEmptyHeader.h"

@implementation BasicEmptyHeader

- (CGFloat)dynamicHeaderHeight {
    return 0.0;
}
- (UIView *)dynamicHeaderView {
    return [[UIView alloc] init];
}
+ (instancetype)create {
    return [[BasicEmptyHeader alloc] init];
}

@end
