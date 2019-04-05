//
//  DynamicBaseRowModel.h
//  A_DynamicTable
//
//  Created by Animax Deng on 5/26/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DynamicBaseRowModel, DynamicTableView;

typedef void (^DynamicBaseRowSelected) (DynamicBaseRowModel *_Nonnull rowModel, UITableViewCell *_Nonnull cell, DynamicTableView *_Nonnull tableView, UIViewController *_Nonnull controller);

typedef void (^DynamicBaseRowCellCreatingWithPrecell) (DynamicBaseRowModel *_Nonnull rowModel, UITableViewCell *_Nonnull precell, DynamicTableView *_Nonnull tableView, UIViewController *_Nonnull controller);
typedef UITableViewCell *_Nonnull(^DynamicBaseRowCellCreating) (DynamicBaseRowModel *_Nonnull rowModel, DynamicTableView *_Nonnull tableView, UIViewController *_Nonnull controller);


@interface DynamicBaseRowModel : NSObject

@property (nullable, readonly, nonatomic, weak) UIViewController *parentController;
@property (nullable, readonly, nonatomic, weak) DynamicTableView *parentTableView;

@property (nullable, nonatomic, strong) NSBundle *cellBundle;
@property (nullable, nonatomic, strong) NSString *xibName;
@property (nullable, nonatomic, strong) NSString *SBIdentifier;

#pragma mark - abstract methods
@property (readonly, nonatomic) CGFloat dynamicCellHeight;
@property (nonnull, readonly, nonatomic, assign) UITableViewCell * dynamicCell;

- (void)setup;
- (void)cellDidCreated: (nonnull UITableViewCell *)cell;
- (void)onRowSelected;

#pragma mark - helping methods
@property (nullable, nonatomic, copy) DynamicBaseRowSelected selectedBlock;
@property (nullable, nonatomic, copy) DynamicBaseRowCellCreating creatingBlock;
@property (nullable, nonatomic, copy) DynamicBaseRowCellCreatingWithPrecell creatingBlockWithPrecell;

@property (nullable, nonatomic, strong) NSIndexPath *pathIndex;

#pragma mark - creation methods
// Create cell from code
+ (nonnull instancetype)createRowWithBlock:(nonnull DynamicBaseRowCellCreating)creationBlock
                                    action:(nonnull DynamicBaseRowSelected)selectedBlock;

// Create cell from XIB
+ (nonnull instancetype)createRowWithXIB:(nonnull NSString *)xibName;

+ (nonnull instancetype)createRowWithXIB:(nonnull NSString *)xibName
                                  bundle:(nonnull NSBundle *)bundle;

+ (nonnull instancetype)createRowWithXIB:(nonnull NSString *)xibName
                                  bundle:(nonnull NSBundle *)bundle
                                  action:(nonnull DynamicBaseRowSelected)selectedBlock;

+ (nonnull instancetype)createRowWithXIB:(nonnull NSString *)xibName
                                  bundle:(nonnull NSBundle *)bundle
                                creation:(nonnull DynamicBaseRowCellCreatingWithPrecell)creatingBlock
                                  action:(nonnull DynamicBaseRowSelected)selectedBlock;

+ (nonnull instancetype)createRowWithXIB:(nonnull NSString *)xibName
                                creation:(nonnull DynamicBaseRowCellCreatingWithPrecell)creatingBlock
                                  action:(nonnull DynamicBaseRowSelected)selectedBlock;

+ (nonnull instancetype)createRowWithXIB:(nonnull NSString *)xibName
                                  action:(nonnull DynamicBaseRowSelected)selectedBlock;


// Create cell from Storyboard Table Cell
+ (nonnull instancetype)createRowWithSBIdentifier:(nonnull NSString *)Identifier;

+ (nonnull instancetype)createRowWithSBIdentifier:(nonnull NSString *)Identifier
                                         creation:(nonnull DynamicBaseRowCellCreatingWithPrecell)creatingBlock
                                           action:(nonnull DynamicBaseRowSelected)selectedBlock;

+ (nonnull instancetype)createRowWithSBIdentifier:(nonnull NSString *)Identifier
                                           action:(nonnull DynamicBaseRowSelected)selectedBlock;

@end
