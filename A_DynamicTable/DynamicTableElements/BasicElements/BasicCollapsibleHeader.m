//
//  BasicCollapsibleHeader.m
//  A_DynamicTable
//
//  Created by Animax Deng on 7/7/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BasicCollapsibleHeader.h"
#import "DynamicTableView.h"

@implementation BasicCollapsibleHeader {
    BOOL _isSectionCollapsed;
}

@synthesize isCollapsed;

- (BOOL)isCollapsed {
    return _isSectionCollapsed;
}
- (void)setIsCollapsed:(BOOL)value {
    _isSectionCollapsed = value;
}

- (void)triggerCollapsed {
    _isSectionCollapsed = !_isSectionCollapsed;
    
    void(^updateBlock)(void)  = ^ {
        [self.parentTableView reloadSections:[[NSIndexSet alloc] initWithIndex:self.sectionIndex]
                            withRowAnimation:UITableViewRowAnimationAutomatic];
        [self onChangedCollapsedState:self state:self->_isSectionCollapsed];
    };
    if ([NSThread isMainThread]) {
        updateBlock();
    } else {
        dispatch_async(dispatch_get_main_queue(), updateBlock);
    }
}

- (void)tapSectionHeader:(UITapGestureRecognizer *)sendor {
    [self triggerCollapsed];
    
    [super tapSectionHeader:sendor];
}

- (void)onChangedCollapsedState:(BasicCollapsibleHeader *)model state:(BOOL)state {
    
}

@end
