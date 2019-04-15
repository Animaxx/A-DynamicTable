//
//  DynamicForm.m
//  A_DynamicTable
//
//  Created by Animax Deng on 3/19/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import "DynamicForm.h"
#import "DynamicEmptyHeader.h"
#import "DynamicSectionGroupHeader.h"

@interface DynamicBaseHeaderModel()

@property (readonly, nonatomic) NSString *sectionId;

@end

@interface DynamicForm()

@property (readwrite, nonatomic) BOOL isGroupSectionTable;
@property (strong, nonatomic) NSMutableOrderedSet<NSString *> *sectionKeys;
@property (strong, nonatomic) NSMapTable<NSString *, DynamicBaseHeaderModel *> *headerModels;
@property (strong, nonatomic) NSMapTable<NSString *, NSMutableArray<DynamicRowModel *> *> *rowModelGroups;

@end

@implementation DynamicForm

@synthesize count;

- (instancetype)init {
    self = [super init];
    if (self) {
        self.sectionKeys = [[NSMutableOrderedSet alloc] init];
        self.headerModels = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsStrongMemory];
        self.rowModelGroups = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsStrongMemory];
    }
    return self;
}

- (NSUInteger)count {
    return [self.sectionKeys count];
}
- (NSMutableArray<DynamicRowModel *> *)objectForHeader:(DynamicBaseHeaderModel *)aKey {
    return [self.rowModelGroups objectForKey:aKey.sectionId];
}
- (void)insertRowGroup:(NSMutableArray<DynamicRowModel *> *)rowGroup forHeader:(DynamicBaseHeaderModel *)aHeader atIndex:(NSUInteger)anIndex {
    [self.sectionKeys setObject:aHeader.sectionId atIndex:anIndex];
    [self.headerModels setObject:aHeader forKey:aHeader.sectionId];
    [self.rowModelGroups setObject:rowGroup forKey:aHeader.sectionId];
    
    if ([aHeader isKindOfClass:[DynamicSectionGroupHeader class]]) {
        self.isGroupSectionTable = YES;
    }
}
- (void)setRowGroup:(NSMutableArray<DynamicRowModel *> *)rowGroup forHeader:(DynamicBaseHeaderModel *)aHeader {
    [self.sectionKeys addObject:aHeader.sectionId];
    [self.headerModels setObject:aHeader forKey:aHeader.sectionId];
    [self.rowModelGroups setObject:rowGroup forKey:aHeader.sectionId];
    
    if ([aHeader isKindOfClass:[DynamicSectionGroupHeader class]]) {
        self.isGroupSectionTable = YES;
    }
}
- (void)removeRowsForHeader:(DynamicBaseHeaderModel *)aKey {
    [self.sectionKeys removeObject:aKey.sectionId];
    [self.headerModels removeObjectForKey:aKey.sectionId];
    [self.rowModelGroups removeObjectForKey:aKey.sectionId];
    
    
    // TODO:
//    for (DynamicBaseHeaderModel *item in [self.headerModels allValues]) {
//        if ([item isKindOfClass:[DynamicSectionGroupHeader class]]) {
//            self.isGroupSectionTable = YES;
//            return;
//        }
//    }
    self.isGroupSectionTable = NO;
}
- (void)removeRowsAtSectionIndex:(NSUInteger)index {
    NSString *key = [self.sectionKeys objectAtIndex:index];
    [self.headerModels removeObjectForKey:key];
    [self.rowModelGroups removeObjectForKey:key];
    self.isGroupSectionTable = NO;
}

- (NSArray<DynamicBaseHeaderModel *> *)allHeaders {
    NSMutableArray *headers = [[NSMutableArray alloc] init];
    for (NSString *key in self.sectionKeys) {
        [headers addObject:[self.headerModels objectForKey:key]];
    }
    return headers;
}

- (DynamicBaseHeaderModel *)lastHeader {
    if ([self.headerModels count] == 0) {
        return nil;
    }
    return [self.headerModels objectForKey:[self.sectionKeys lastObject]];
}
- (DynamicBaseHeaderModel *)firstHeader {
    if ([self.headerModels count] == 0) {
        return nil;
    }
    return [self.headerModels objectForKey:[self.sectionKeys firstObject]];
}
- (DynamicBaseHeaderModel *)getHeaderAtIndex:(NSInteger)index {
    NSString *key = [self.sectionKeys objectAtIndex:index];
    return key ? [self.headerModels objectForKey:key] : nil;
}

- (NSMutableArray<DynamicRowModel *> *)lastSectionOfRows {
    if ([self.rowModelGroups count] == 0) {
        return nil;
    }
    return [self.rowModelGroups objectForKey:[self.sectionKeys lastObject]];
}
- (NSMutableArray<DynamicRowModel *> *)firstSectionOfRows {
    if ([self.rowModelGroups count] == 0) {
        return nil;
    }
    return [self.rowModelGroups objectForKey:[self.sectionKeys firstObject]];
}
- (NSMutableArray<DynamicRowModel *> *)rowsAtIndex:(NSInteger)index {
    NSString *key = [self.sectionKeys objectAtIndex:index];
    return key ? [self.rowModelGroups objectForKey:key] : nil;
}

- (DynamicRowModel *)getRow:(NSIndexPath *)indexPath {
    NSString *key = [self.sectionKeys objectAtIndex:indexPath.section];
    return [[self.rowModelGroups objectForKey:key] objectAtIndex:indexPath.row];
}

- (NSArray<DynamicRowModel *> *)allRows {
    NSMutableArray<DynamicRowModel *> * rows = [[NSMutableArray alloc] init];
    for (NSString* itemKey in self.sectionKeys) {
        NSMutableArray<DynamicRowModel *> *items = [self.rowModelGroups objectForKey:itemKey];
        [rows addObjectsFromArray:items];
    }
    return rows;
}

- (NSArray<DynamicRowModel *> *)getTypeOfRows:(Class)rowType {
    NSMutableArray *rows = [[NSMutableArray alloc] init];
    for (NSString* key in self.sectionKeys) {
        for (DynamicRowModel *item in [self.rowModelGroups objectForKey:key]) {
            if ([item isKindOfClass:rowType]) {
                [rows addObject:item];
            }
        }
    }
    return rows;
}

- (DynamicForm *)removeAllRows {
    [self.rowModelGroups removeAllObjects];
    [self.headerModels removeAllObjects];
    [self.sectionKeys removeAllObjects];
    
    self.isGroupSectionTable = NO;
    return self;
}
- (DynamicForm *)addRow:(DynamicRowModel *)row {
    if (self.count == 0) {
        DynamicEmptyHeader *header = [[DynamicEmptyHeader alloc] init];
        [self insertRowGroup:[@[row] mutableCopy] forHeader:header atIndex:0];
    } else {
        [((NSMutableArray<DynamicRowModel *> *)[self lastSectionOfRows]) addObject:row];
    }
    [row setup];
    
    return self;
}
- (DynamicForm *)addRow:(DynamicRowModel *)row atSection:(NSInteger)section {
    if (self.count > section) {
        [((NSMutableArray<DynamicRowModel *> *)[self rowsAtIndex:section]) addObject:row];
        [row setup];
    } else {
        NSLog(@"[ERROR] Section index exceeded in DynamicForm - addRow:atSection");
    }
    
    return self;
}
- (DynamicForm *)addRow:(DynamicRowModel *)row toSection:(DynamicBaseHeaderModel *)section {
    [[self objectForHeader:section] addObject:row];
    [row setup];
    
    return self;
}
- (DynamicForm *)addSection:(DynamicBaseHeaderModel *)section {
    NSString *key = section.sectionId;
    if ([self.sectionKeys containsObject:key]) {
        NSLog(@"[ERROR] Section already exisit in DynamicForm - addSection:");
    } else {
        [self.headerModels setObject:section forKey:key];
        [self.rowModelGroups setObject:[[NSMutableArray alloc] init] forKey:key];
        
        if ([section isKindOfClass:[DynamicSectionGroupHeader class]]) {
            self.isGroupSectionTable = YES;
        }
    }
    [section setup];
    
    return self;
}



@end
