//
//  DynamicForm.h
//  A_DynamicTable
//
//  Created by Animax Deng on 3/19/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicBaseHeaderModel.h"
#import "DynamicRowModel.h"

/**
 DynamicForm is the data container for Dynamic
 */
@interface DynamicForm : NSObject

@property (readonly) NSUInteger count;
@property (readonly, nonatomic) BOOL isGroupSectionTable;

- (nullable NSMutableArray<DynamicRowModel *> *)objectForHeader:(nonnull DynamicBaseHeaderModel *)aKey;
- (void)insertRowGroup:(nonnull NSMutableArray<DynamicRowModel *> *)rowGroup forHeader:(nonnull DynamicBaseHeaderModel *)aHeader atIndex:(NSUInteger)anIndex;
- (void)setRowGroup:(nonnull NSMutableArray<DynamicRowModel *> *)rowGroup forHeader:(nonnull DynamicBaseHeaderModel *)aHeader;
- (void)removeRowsForHeader:(nonnull DynamicBaseHeaderModel *)aKey;
- (void)removeRowsAtSectionIndex:(NSUInteger)index;

- (nullable DynamicBaseHeaderModel *)lastHeader;
- (nullable DynamicBaseHeaderModel *)firstHeader;
- (nullable DynamicBaseHeaderModel *)getHeaderAtIndex:(NSInteger)index;

- (nullable NSArray<DynamicRowModel *> *)lastSectionOfRows;
- (nullable NSArray<DynamicRowModel *> *)firstSectionOfRows;
- (nullable NSArray<DynamicRowModel *> *)rowsAtIndex:(NSInteger)index;

- (nonnull NSArray<DynamicBaseHeaderModel *> *)allHeaders;
- (nonnull NSArray<DynamicRowModel *> *)allRows;

/**
 Get Row by indexPath

 @param indexPath NSIndexPath
 @return DynamicRowModel
 */
- (nullable DynamicRowModel *)getRow:(nonnull NSIndexPath *)indexPath;

/**
 Get Rows by Class type
 
 @param rowType CLass
 @return DynamicRowModel Array
 */
- (nullable NSArray<DynamicRowModel *> *)getTypeOfRows:(nonnull Class)rowType;

/**
 Add Row model to currect header;
 if the table doen't have any header, then it will add empty header.
 
 @param row DynamicRowModel
 */
- (nonnull DynamicForm *)addRow:(nonnull DynamicRowModel *)row;


/**
 Add Row model to header by index number

 @param row DynamicRowModel
 @param section NSInteger
 */
- (nonnull DynamicForm *)addRow:(nonnull DynamicRowModel *)row atSection:(NSInteger)section;


/**
 Add Row model to header

 @param row DynamicRowModel
 @param section NSInteger
 */
- (nonnull DynamicForm *)addRow:(nonnull DynamicRowModel *)row toSection:(nonnull DynamicBaseHeaderModel *)section;


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
