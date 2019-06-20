//
//  DynamicRowModel.h
//  A_DynamicTable
//
//  Created by Animax Deng on 5/26/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DynamicRowModel, DynamicTableView;

typedef void (^DynamicRowSelectedBlock) (DynamicRowModel *_Nonnull rowModel, UITableViewCell *_Nonnull cell, DynamicTableView *_Nonnull tableView, UIViewController *_Nonnull controller);

typedef void (^DynamicRowCellDidLoadBlock) (DynamicRowModel *_Nonnull rowModel, UITableViewCell *_Nonnull cell, DynamicTableView *_Nonnull tableView, UIViewController *_Nonnull controller);
typedef UITableViewCell *_Nonnull(^DynamicRowCellCreateBlock) (DynamicRowModel *_Nonnull rowModel, DynamicTableView *_Nonnull tableView, UIViewController *_Nonnull controller);


//@interface DynamicRowModel<__covariant CellType:UITableViewCell *> : NSObject
@interface DynamicRowModel: NSObject

@property (nullable, readonly, nonatomic, weak) UIViewController *parentController;
@property (nullable, readonly, nonatomic, weak) DynamicTableView *parentTableView;

@property (nullable, nonatomic, strong) NSBundle *cellBundle;
@property (nullable, nonatomic, strong) NSString *xibName;
@property (nullable, nonatomic, strong) NSString *SBIdentifier;

#pragma mark - abstract methods for override
@property (readonly, nonatomic) CGFloat dynamicCellHeight;
@property (nonnull, readonly, nonatomic, assign) UITableViewCell * dynamicCell;

/**
 Abstract method - init setup for the row model, will call once.
 */
- (void)setup;

/**
 Abstract method - call every time when cell loaded under tableView:cellForRowAtIndexPath
 The function is same as **cellDidLoadBlock** with higher priority
 @param cell UITableViewCell
 */
- (void)cellDidLoad: (nonnull UITableViewCell *)cell;


/**
 Abstract method - call every time when user tap on cell under tableView:didSelectRowAtIndexPath
 The Function is same as **cellSelectedBlock** with higher priority
 */
- (void)onRowSelected;


/**
 Abstract method - for create cell from code
 The Function is same as **cellCreateBlock** with lower priority
 
 @return UITableViewCell
 */
- (nullable UITableViewCell *) onCreateDynamicRowCell;

#pragma mark - action blocks

/**
 Block method - will call every time when user tap on cell under tableView:didSelectRowAtIndexPath
 Function is same as onRowSelected with lower priority
 */
@property (nullable, nonatomic, copy) DynamicRowSelectedBlock cellSelectedBlock;

/**
 Block method - for create UITableCell from code, if SBIdentifier and XIB are not set, this block will be call to create UITableCell
 */
@property (nullable, nonatomic, copy) DynamicRowCellCreateBlock cellCreateBlock;


/**
 Block method - will call every time when cell loaded under tableView:cellForRowAtIndexPath
 Function is same as cellDidLoad: with lower priority
 */
@property (nullable, nonatomic, copy) DynamicRowCellDidLoadBlock cellDidLoadBlock;

@property (nullable, nonatomic, strong) NSIndexPath *pathIndex;


@end
