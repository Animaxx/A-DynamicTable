//
//  DynamicBaseHeaderModel.h
//  A_DynamicTable
//
//  Created by Animax Deng on 5/10/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/*
 Foundatetion Header, all headers in dynamic table should inherit from this.
 */
@class DynamicHeaderModel, DynamicTableView;

typedef UIView *(^DynamicBeaderCreating) (DynamicHeaderModel *headerModel, DynamicTableView *tableView, UIViewController *controller);
typedef void (^DynamicHeaderCreatingWithPreheader) (DynamicHeaderModel *headerModel, UIView *headerView, DynamicTableView *tableView, UIViewController *controller);

typedef void (^DynamicHeaderSelected) (DynamicHeaderModel *headerModel, UIView *headerView, DynamicTableView *tableView, UIViewController *controller);


@interface DynamicHeaderModel : NSObject

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



@end

