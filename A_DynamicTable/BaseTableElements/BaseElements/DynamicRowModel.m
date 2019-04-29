//
//  DynamicRowModel.m
//  A_DynamicTable
//
//  Created by Animax Deng on 5/26/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicRowModel.h"

@interface DynamicRowModel()

@property (nonatomic, weak) UIViewController *parentController;
@property (nonatomic, weak) DynamicTableView *parentTableView;

@property (nonatomic, weak) UITableViewCell *currectDynamicCell;

@end

@implementation DynamicRowModel {
    
}

@synthesize dynamicCellHeight, dynamicCell;

// TODO: Release table view cell when it not needed
- (UITableViewCell *)dynamicCell {
    UITableViewCell *cell = self.currectDynamicCell;
    
    if (self.parentTableView) {
        UIViewController *controller = [self parentController];
        
        if (self.xibName && [self.xibName length] > 0) {
            if (cell) {
                return cell;
            }
            
            NSBundle *bundle = self.cellBundle;
            if (!bundle) {
                bundle = [NSBundle mainBundle];
            }
            
            id owner = controller;
            if (!owner) {
                owner = self;
            }
            cell = [[bundle loadNibNamed:self.xibName owner:owner options:nil] firstObject];
            
            if (!cell) {
                NSLog(@"DynamicCell: XIB %@ is not able to load", self.xibName);
            }
            
            if (self.cellDidLoadBlock) {
                self.cellDidLoadBlock(self, cell, self.parentTableView, controller);
            }
        } else if (self.SBIdentifier && [self.SBIdentifier length] > 0) {
            cell = [(UITableView *)self.parentTableView dequeueReusableCellWithIdentifier:self.SBIdentifier forIndexPath:self.pathIndex];
            if (!cell) {
                NSLog(@"DynamicCell: Storyboard cell %@ is not able to load", self.SBIdentifier);
            }
            
            if (self.cellDidLoadBlock) {
                self.cellDidLoadBlock(self, cell, self.parentTableView, controller);
            }
        } else if (self.cellCreateBlock) {
            if (cell) {
                return cell;
            }
            
            cell = self.cellCreateBlock(self, self.parentTableView, controller);
            if (self.cellDidLoadBlock) {
                self.cellDidLoadBlock(self, cell, self.parentTableView, controller);
            }
        }
        
        if (cell) {
            [self cellDidLoad:cell];
        }
    }
    
    if (!cell) {
        return [[UITableViewCell alloc] init];
    } else {
        self.currectDynamicCell = cell;
        return cell;
    }
}
- (CGFloat)dynamicCellHeight {
    return UITableViewAutomaticDimension;
}
- (void)onRowSelected {
    if (self.cellSelectedBlock) {
        UIViewController *controller = [self parentController];
        self.cellSelectedBlock(self, self.currectDynamicCell, self.parentTableView, controller);
    }
}

- (void)setup {
    
}
- (void)cellDidLoad: (UITableViewCell *)cell {
    
}

+ (instancetype)createRowWithBlock:(DynamicRowCellCreateBlock)creationBlock action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setCellCreateBlock:creationBlock];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName
                          bundle:(NSBundle *)bundle {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setCellBundle:bundle];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName
                          bundle:(NSBundle *)bundle
                          action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setCellBundle:bundle];
    [model setXibName:xibName];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName
                          bundle:(NSBundle *)bundle
                        creation:(DynamicRowCellDidLoadBlock)creatingBlock
                          action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setCellBundle:bundle];
    [model setXibName:xibName];
    [model setCellDidLoadBlock:creatingBlock];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName
                        creation:(DynamicRowCellDidLoadBlock)creatingBlock
                          action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setCellDidLoadBlock:creatingBlock];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName
                          action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithSBIdentifier:(NSString *)Identifier {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setSBIdentifier:Identifier];
    
    return model;
}

+ (instancetype)createRowWithSBIdentifier:(NSString *)Identifier
                                 creation:(DynamicRowCellDidLoadBlock)creatingBlock
                                   action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setSBIdentifier:Identifier];
    [model setCellDidLoadBlock: creatingBlock];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithSBIdentifier:(NSString *)Identifier
                                   action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setSBIdentifier:Identifier];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

@end
