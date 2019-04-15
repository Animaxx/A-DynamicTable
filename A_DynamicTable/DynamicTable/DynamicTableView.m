//
//  DynamicTableView.m
//  A_DynamicTable
//
//  Created by Animax Deng on 3/19/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import "DynamicTableView.h"
#import "CollapsibleHeader.h"
#import "DynamicSectionGroupHeader.h"

@interface DynamicBaseHeaderModel()

@property (nonatomic, weak) DynamicTableView *parentTableView;
@property (nonatomic, weak) UIViewController *parentController;

@end

@interface DynamicRowModel()

@property (nonatomic, weak) DynamicTableView *parentTableView;
@property (nonatomic, weak) UIViewController *parentController;

@end

@interface DynamicTableView() <UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, weak) UIViewController *parentController;

@end

@implementation DynamicTableView

- (void)didMoveToWindow {
    [super didMoveToWindow];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUpTableView];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpTableView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUpTableView];
    }
    return self;
}

- (void)setUpTableView {
    self.form = [[DynamicForm alloc] init];
    
    self.delegate = self;
    self.dataSource = self;
}

- (UIViewController *)findParentController {
    if (self.parentController) {
        return self.parentController;
    } else {
        for (UIView* next = [self superview]; next; next = next.superview) {
            UIResponder* nextResponder = [next nextResponder];
            
            if ([nextResponder isKindOfClass:[UIViewController class]]) {
                self.parentController = (UIViewController*)nextResponder;
                return self.parentController;
            }
        }
    }
    
    return nil;
}

- (void)reloadData {
    [super reloadData];
    
    if (!self.tableFooterView) {
        self.tableFooterView = [[UIView alloc] init];
    }
}

#pragma mark - implement UIScrollViewDelegate


#pragma mark - implement UITableViewDelegate and UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.form count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    DynamicBaseHeaderModel *header = [self.form getHeaderAtIndex:section];
    if ([header isKindOfClass:[CollapsibleHeader class]] && ((CollapsibleHeader *)header).isCollapsed) {
        return 0;
    } else {
        return [[self.form rowsAtIndex:section] count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DynamicRowModel *model = [self.form getRow:indexPath];
    [model setParentTableView:self];
    [model setParentController:[self findParentController]];
    [model setPathIndex:indexPath];
    return [model dynamicCell];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    DynamicBaseHeaderModel *sectionModel = [self.form getHeaderAtIndex:section];
    [sectionModel setSectionIndex:section];
    [sectionModel setParentTableView:self];
    [sectionModel setParentController:[self findParentController]];
    
    UIView *view = [sectionModel dynamicHeaderView];
    if (!view) {
        view = [[UIView alloc] init];
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    DynamicBaseHeaderModel *sectionModel = [self.form getHeaderAtIndex:section];
    [sectionModel setSectionIndex:section];
    [sectionModel setParentTableView:self];
    [sectionModel setParentController:[self findParentController]];
    
    return [sectionModel dynamicHeaderHeight];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.form getRow:indexPath] dynamicCellHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [[self.form getRow:indexPath] dynamicCellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DynamicRowModel *model = [self.form getRow:indexPath];
    [model setPathIndex:indexPath];
    [model onRowSelected];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    if ([self.form isGroupSectionTable]) {
        for (DynamicSectionGroupHeader *item in [self.form allHeaders]) {
            if ([item isKindOfClass:[DynamicSectionGroupHeader class]] && [[item sectionName] isEqualToString:title]) {
                return [item sectionIndex];
            }
        }
    }
    
    return 0;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    if ([self.form isGroupSectionTable]) {
        NSArray<DynamicBaseHeaderModel *> *headers = [self.form allHeaders];
        NSMutableOrderedSet *titles = [[NSMutableOrderedSet alloc] init];
        
        for (DynamicSectionGroupHeader *item in headers) {
            if ([item isKindOfClass:[DynamicSectionGroupHeader class]] && [item sectionName]) {
                [titles addObject:[item sectionName]];
            }
        }
        
        return [titles array];
    } else {
        return @[];
    }
}


@end
