//
//  DynamicBaseHeaderModel.h
//  A_DynamicTable
//
//  Created by Animax Deng on 5/10/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@class DynamicBaseHeaderModel, DynamicTableView;

typedef UIView *(^DynamicBeaderCreating) (DynamicBaseHeaderModel *headerModel, DynamicTableView *tableView, UIViewController *controller);
typedef void (^DynamicHeaderCreatingWithPreheader) (DynamicBaseHeaderModel *headerModel, UIView *headerView, DynamicTableView *tableView, UIViewController *controller);

typedef void (^DynamicHeaderSelected) (DynamicBaseHeaderModel *headerModel, UIView *headerView, DynamicTableView *tableView, UIViewController *controller);


@interface DynamicBaseHeaderModel : NSObject

@property (readonly, nonatomic, weak) UIViewController *parentController;
@property (readonly, nonatomic, weak) DynamicTableView *parentTableView;

@property (nonatomic, strong) NSBundle *headerBundle;
@property (nonatomic, strong) NSString *xibName;

#pragma mark - abstract methods
@property (readonly, nonatomic) CGFloat dynamicHeaderHeight;
@property (readonly, nonatomic, assign) UIView * dynamicHeaderView;

- (void)setup;
- (void)headerDidCreated: (UIView *)header;

#pragma mark - helping methods
@property (nonatomic) NSInteger sectionIndex;

@property (nonatomic, copy) DynamicHeaderSelected selectedBlock;
@property (nonatomic, copy) DynamicBeaderCreating creatingBlock;
@property (nonatomic, copy) DynamicHeaderCreatingWithPreheader creatingBlockWithPreheader;

- (void)tapSectionHeader:(UITapGestureRecognizer *)sendor;

#pragma mark - creation methods
+ (instancetype)createHeaderWithBlock:(DynamicBeaderCreating)creationBlock;

+ (instancetype)createHeaderWithBlock:(DynamicBeaderCreating)creationBlock action:(DynamicHeaderSelected)selectedAction;

+ (instancetype)createRowWithXIB:(NSString *)xibName;

+ (instancetype)createRowWithXIB:(NSString *)xibName
                                         action:(DynamicHeaderSelected)selectedAction;

+ (instancetype)createRowWithXIB:(NSString *)xibName
                                  creationBlock:(DynamicHeaderCreatingWithPreheader)creationBlock
                                         action:(DynamicHeaderSelected)selectedAction;

+ (instancetype)createRowWithXIB:(NSString *)xibName
                                       creation:(DynamicHeaderCreatingWithPreheader)creatingBlock;

+ (instancetype)createRowWithXIB:(NSString *)xibName
                                         bundle:(NSBundle *)bundle
                                       creation:(DynamicHeaderCreatingWithPreheader)creatingBlock;

+ (instancetype)createRowWithXIB:(NSString *)xibName
                                         bundle:(NSBundle *)bundle
                                       creation:(DynamicHeaderCreatingWithPreheader)creatingBlock
                                         action:(DynamicHeaderSelected)selectedAction;

@end
