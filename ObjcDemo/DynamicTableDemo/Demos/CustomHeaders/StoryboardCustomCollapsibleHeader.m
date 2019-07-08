//
//  StoryboardCustomCollapsibleHeader.m
//  DynamicTableDemo
//
//  Created by Animax Deng on 7/7/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "StoryboardCustomCollapsibleHeader.h"

@implementation StoryboardCustomCollapsibleHeader {
    NSString *_titleStr;
}


+ (StoryboardCustomCollapsibleHeader *)createWithTitle:(NSString *)title {
    StoryboardCustomCollapsibleHeader *header = [[StoryboardCustomCollapsibleHeader alloc] init];
    header->_titleStr = title;
    return header;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.xibName = @"CustomCollapsibleHeader";
        self.headerBundle = [NSBundle mainBundle];
    }
    return self;
}

- (void)headerDidCreated:(UIView *)header {
    UILabel *titleLabel = [header viewWithTag:1];
    if (titleLabel && [titleLabel isKindOfClass:[UILabel class]]) {
        [titleLabel setText:self->_titleStr];
    }
    
    UILabel *stateLabel = [header viewWithTag:2];
    if (stateLabel && [stateLabel isKindOfClass:[UILabel class]]) {
        [stateLabel setText:@"Close"];
    }
}
- (void)onChangedCollapsedState:(BasicCollapsibleHeader *)model state:(BOOL)state {
    UILabel *stateLabel = [model.dynamicHeaderView viewWithTag:2];
    if (stateLabel && [stateLabel isKindOfClass:[UILabel class]]) {
        [stateLabel setText:state?@"Open":@"Close"];
    }
}

@end
