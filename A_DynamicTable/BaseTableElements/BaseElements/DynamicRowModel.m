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
        
        if (!cell && self.xibName && [self.xibName length] > 0) {
            self.SBIdentifier = [self.xibName stringByAppendingString:@"-identifier"];
            cell = [(UITableView *)self.parentTableView dequeueReusableCellWithIdentifier:self.SBIdentifier];
            if (!cell) {
                NSBundle *bundle = self.cellBundle;
                if (!bundle) {
                    bundle = [NSBundle mainBundle];
                }
                
                // load xib cell from bundle
//                id owner = controller;
//                if (!owner) {
//                    owner = self;
//                }
//                cell = [[bundle loadNibNamed:self.xibName owner:owner options:nil] firstObject];
                
                UINib *cellNib = [UINib nibWithNibName:self.xibName bundle:bundle];
                
                [(UITableView *)self.parentTableView registerNib:cellNib forCellReuseIdentifier:self.SBIdentifier];
                
                cell = [(UITableView *)self.parentTableView dequeueReusableCellWithIdentifier:self.SBIdentifier forIndexPath:self.pathIndex];
                
                if (!cell) {
                    NSLog(@"DynamicCell: XIB %@ is not able to load", self.xibName);
                }
            }
        } else if (self.SBIdentifier && [self.SBIdentifier length] > 0) {
            cell = [(UITableView *)self.parentTableView dequeueReusableCellWithIdentifier:self.SBIdentifier forIndexPath:self.pathIndex];
            if (!cell) {
                NSLog(@"DynamicCell: Storyboard cell %@ is not able to load", self.SBIdentifier);
            }
            
        } else if (!cell && self.cellCreateBlock) {
            cell = self.cellCreateBlock(self, self.parentTableView, controller);
        } else if (!cell && [self respondsToSelector:@selector(onCreateDynamicRowCell)]) {
            cell = [self onCreateDynamicRowCell];
        }
        
        if (!cell) {
            cell = [[UITableViewCell alloc] init];
        }
        
        if (self.cellDidLoadBlock) {
            self.cellDidLoadBlock(self, cell, self.parentTableView, controller);
        } else {
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
- (UITableViewCell *) onCreateDynamicRowCell {
    return nil;
}

@end
