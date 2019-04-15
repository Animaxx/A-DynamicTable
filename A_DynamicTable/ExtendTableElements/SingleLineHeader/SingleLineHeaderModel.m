//
//  SingleLineHeaderModel.m
//  A_DynamicTable
//
//  Created by Animax Deng on 4/6/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "SingleLineHeaderModel.h"

@implementation SingleLineHeaderModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [super setHeaderBundle:[NSBundle bundleForClass:[self class]]];
        [super setXibName:@"SingleLineHeaderModel"];
    }
    return self;
}
- (void)headerDidCreated:(UIView *)header {
    
}


@end
