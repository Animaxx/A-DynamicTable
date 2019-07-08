//
//  DynamicGroupHeader.m
//  A_DynamicTable
//
//  Created by Animax Deng on 2/12/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "DynamicSectionGroupHeader.h"

@implementation DynamicSectionGroupHeader

- (instancetype)setSectionTitle:(NSString *)name {
    [self setSectionName:name];
    return self;
}

@end
