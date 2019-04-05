//
//  DynamicForm.h
//  A_DynamicTable
//
//  Created by Animax Deng on 3/19/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicBaseHeaderModel.h"
#import "DynamicBaseRowModel.h"

/**
 DynamicForm is the data container for Dynamic
 */
@interface DynamicForm : NSObject

@property (readonly) NSUInteger count;
@property (readonly, nonatomic) BOOL isGroupSectionTable;

- (nullable NSMutableArray<DynamicBaseRowModel *> *)objectForHeader:(nonnull DynamicBaseHeaderModel *)aKey;
- (void)insertRowGroup:(nonnull NSMutableArray<DynamicBaseRowModel *> *)rowGroup forHeader:(nonnull DynamicBaseHeaderModel *)aHeader atIndex:(NSUInteger)anIndex;
- (void)setRowGroup:(nonnull NSMutableArray<DynamicBaseRowModel *> *)rowGroup forHeader:(nonnull DynamicBaseHeaderModel *)aHeader;
- (void)removeRowsForHeader:(nonnull DynamicBaseHeaderModel *)aKey;
- (void)removeRowsAtSectionIndex:(NSUInteger)index;

- (nullable DynamicBaseHeaderModel *)lastHeader;
- (nullable DynamicBaseHeaderModel *)firstHeader;
- (nullable DynamicBaseHeaderModel *)getHeaderAtIndex:(NSInteger)index;

- (nullable NSArray<DynamicBaseRowModel *> *)lastSectionOfRows;
- (nullable NSArray<DynamicBaseRowModel *> *)firstSectionOfRows;
- (nullable NSArray<DynamicBaseRowModel *> *)rowsAtIndex:(NSInteger)index;

- (nonnull NSArray<DynamicBaseHeaderModel *> *)allHeaders;
- (nonnull NSArray<DynamicBaseRowModel *> *)allRows;

/**
 Get Row by indexPath

 @param indexPath NSIndexPath
 @return DynamicBaseRowModel
 */
- (nullable DynamicBaseRowModel *)getRow:(nonnull NSIndexPath *)indexPath;

/**
 Get Rows by Class type
 
 @param rowType CLass
 @return DynamicBaseRowModel Array
 */
- (nullable NSArray<DynamicBaseRowModel *> *)getTypeOfRows:(nonnull Class)rowType;

/**
 Add Row model to currect header;
 if the table doen't have any header, then it will add empty header.
 
 @param row DynamicBaseRowModel
 */
- (nonnull DynamicForm *)addRow:(nonnull DynamicBaseRowModel *)row;


/**
 Add Row model to header by index number

 @param row DynamicBaseRowModel
 @param section NSInteger
 */
- (nonnull DynamicForm *)addRow:(nonnull DynamicBaseRowModel *)row atSection:(NSInteger)section;


/**
 Add Row model to header

 @param row DynamicBaseRowModel
 @param section NSInteger
 */
- (nonnull DynamicForm *)addRow:(nonnull DynamicBaseRowModel *)row toSection:(nonnull DynamicBaseHeaderModel *)section;


/**
 Add Section

 @param section DynamicBaseHeaderModel
 */
- (nonnull DynamicForm *)addSection:(nonnull DynamicBaseHeaderModel *)section;


/**
 Remove all elements in the form
 */
- (nonnull DynamicForm *)removeAllRows;

@end
