//
//  DynamicBaseRowModel.m
//  A_DynamicTable
//
//  Created by Animax Deng on 5/26/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicBaseRowModel.h"

@interface DynamicBaseRowModel()

@property (nonatomic, weak) UIViewController *parentController;
@property (nonatomic, weak) DynamicTableView *parentTableView;

@property (nonatomic, strong) UITableViewCell *currectDynamicCell;

@end

@implementation DynamicBaseRowModel {
    
}

@synthesize dynamicCellHeight, dynamicCell;

// TODO: Release table view cell when it not needed
- (UITableViewCell *)dynamicCell {
    if (!self.currectDynamicCell && self.parentTableView) {
        UIViewController *controller = [self parentController];

        if (self.creatingBlock) {
            self.currectDynamicCell = self.creatingBlock(self, self.parentTableView, controller);
        } else if (self.xibName && [self.xibName length] > 0) {
            NSBundle *bundle = self.cellBundle;
            if (!bundle) {
                bundle = [NSBundle mainBundle];
            }

            id owner = controller;
            if (!owner) {
                owner = self;
            }
            self.currectDynamicCell = [[bundle loadNibNamed:self.xibName owner:owner options:nil] firstObject];

            if (!self.currectDynamicCell) {
                NSLog(@"DynamicCell: XIB %@ is not able to load", self.xibName);
            }

            if (self.creatingBlockWithPrecell) {
                self.creatingBlockWithPrecell(self, self.currectDynamicCell, self.parentTableView, controller);
            }
        } else if (self.SBIdentifier && [self.SBIdentifier length] > 0) {
            self.currectDynamicCell = [(UITableView *)self.parentTableView dequeueReusableCellWithIdentifier:self.SBIdentifier forIndexPath:self.pathIndex];
            if (!self.currectDynamicCell) {
                NSLog(@"DynamicCell: Storyboard cell %@ is not able to load", self.SBIdentifier);
            }
            
            if (self.creatingBlockWithPrecell) {
                self.creatingBlockWithPrecell(self, self.currectDynamicCell, self.parentTableView, controller);
            }
        }

        if (self.currectDynamicCell) {
            [self cellDidCreated:self.currectDynamicCell];
        }
    } else if (self.SBIdentifier && [self.SBIdentifier length] > 0) {
        // For the cell using identifier, try to get the cell from position. if it's gone then have to re-create
        self.currectDynamicCell = [(UITableView *)self.parentTableView cellForRowAtIndexPath:self.pathIndex];
        NSLog(@"path index %@", self.pathIndex);
        NSLog(@"path index %@", self.SBIdentifier);

        if (!self.currectDynamicCell) {
            // If the cell is created from sotryboard indentifier then re-general the cell every time.
            UIViewController *controller = [self parentController];
            self.currectDynamicCell = [(UITableView *)self.parentTableView dequeueReusableCellWithIdentifier:self.SBIdentifier forIndexPath:self.pathIndex];
            if (!self.currectDynamicCell) {
                NSLog(@"DynamicCell: Storyboard cell %@ is not able to load", self.SBIdentifier);
            }

            if (self.creatingBlockWithPrecell) {
                self.creatingBlockWithPrecell(self, self.currectDynamicCell, self.parentTableView, controller);
            }
            if (self.currectDynamicCell) {
                [self cellDidCreated:self.currectDynamicCell];
            }
        }
    }
    
    if (!self.currectDynamicCell) {
        return [[UITableViewCell alloc] init];
    } else {
        return self.currectDynamicCell;
    }
}
- (CGFloat)dynamicCellHeight {
    return UITableViewAutomaticDimension;
}
- (void)onRowSelected {
    if (self.selectedBlock) {
        UIViewController *controller = [self parentController];
        self.selectedBlock(self, self.currectDynamicCell, self.parentTableView, controller);
    }
}

- (void)setup {
    
}
- (void)cellDidCreated: (UITableViewCell *)cell {
    
}

+ (instancetype)createRowWithBlock:(DynamicBaseRowCellCreating)creationBlock action:(DynamicBaseRowSelected)selectedBlock {
    DynamicBaseRowModel *model = [[[self class] alloc] init];
    [model setCreatingBlock:creationBlock];
    [model setSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName {
    DynamicBaseRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName
                                      bundle:(NSBundle *)bundle {
    DynamicBaseRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setCellBundle:bundle];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName
                                      bundle:(NSBundle *)bundle
                                      action:(DynamicBaseRowSelected)selectedBlock {
    DynamicBaseRowModel *model = [[[self class] alloc] init];
    [model setCellBundle:bundle];
    [model setXibName:xibName];
    [model setSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName
                                      bundle:(NSBundle *)bundle
                                    creation:(DynamicBaseRowCellCreatingWithPrecell)creatingBlock
                                      action:(DynamicBaseRowSelected)selectedBlock {
    DynamicBaseRowModel *model = [[[self class] alloc] init];
    [model setCellBundle:bundle];
    [model setXibName:xibName];
    [model setCreatingBlockWithPrecell:creatingBlock];
    [model setSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName
                                    creation:(DynamicBaseRowCellCreatingWithPrecell)creatingBlock
                                      action:(DynamicBaseRowSelected)selectedBlock {
    DynamicBaseRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setCreatingBlockWithPrecell:creatingBlock];
    [model setSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithXIB:(NSString *)xibName
                                      action:(DynamicBaseRowSelected)selectedBlock {
    DynamicBaseRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithSBIdentifier:(NSString *)Identifier {
    DynamicBaseRowModel *model = [[[self class] alloc] init];
    [model setSBIdentifier:Identifier];
    
    return model;
}

+ (instancetype)createRowWithSBIdentifier:(NSString *)Identifier
                                             creation:(DynamicBaseRowCellCreatingWithPrecell)creatingBlock
                                               action:(DynamicBaseRowSelected)selectedBlock {
    DynamicBaseRowModel *model = [[[self class] alloc] init];
    [model setSBIdentifier:Identifier];
    [model setCreatingBlockWithPrecell: creatingBlock];
    [model setSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)createRowWithSBIdentifier:(NSString *)Identifier
                                               action:(DynamicBaseRowSelected)selectedBlock {
    DynamicBaseRowModel *model = [[[self class] alloc] init];
    [model setSBIdentifier:Identifier];
    [model setSelectedBlock:selectedBlock];
    
    return model;
}

@end
