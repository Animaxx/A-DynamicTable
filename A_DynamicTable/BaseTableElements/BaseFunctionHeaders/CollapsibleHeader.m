//
//  CollapsibleHeader.m
//  A_DynamicTable
//
//  Created by Animax Deng on 4/4/19.
//  Copyright © 2018 Animax. All rights reserved.
//

#import "CollapsibleHeader.h"
#import "DynamicTableView.h"

@interface DynamicHeaderModel()

@property (nonatomic, weak) UIViewController *parentController;
@property (nonatomic, weak) DynamicTableView *parentTableView;

@end

@implementation CollapsibleHeader {
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
}
- (void)tapSectionHeader:(UITapGestureRecognizer *)sendor {
    [self triggerCollapsed];
    [super tapSectionHeader:sendor];
    [self.parentTableView reloadSections:[[NSIndexSet alloc] initWithIndex:self.sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
}

@end
