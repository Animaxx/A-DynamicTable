
//  DynamicBaseHeaderModel.m
//  A_DynamicTable
//
//  Created by Animax Deng on 5/10/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import "DynamicHeaderModel.h"

@interface DynamicHeaderModel()

@property (nonatomic, weak) UIViewController *parentController;
@property (nonatomic, weak) DynamicTableView *parentTableView;
@property (nonatomic, strong) UIView * headerView;
@property (readonly, nonatomic) NSString *sectionId;

@end

@implementation DynamicHeaderModel {
    NSString *__sectionId;
}

@synthesize dynamicHeaderView, dynamicHeaderHeight, sectionId;

- (void)setup {
    
}
- (void)headerDidCreated: (UIView *)header {
    
}

- (NSString *)sectionId {
    if (!__sectionId) {
        __sectionId = [[NSUUID UUID] UUIDString];
    }
    return [__sectionId copy];
}
- (CGFloat)dynamicHeaderHeight {
    UIView *header = [self dynamicHeaderView];
    return header.frame.size.height;
}
- (UIView *)dynamicHeaderView {
    if (!self.headerView) {
        if (self.creatingBlock) {
            self.headerView = self.creatingBlock(self, self.parentTableView, self.parentController);
        } else if (self.xibName) {
            NSBundle *bundle = self.headerBundle;
            if (!bundle) {
                bundle = [NSBundle mainBundle];
            }
            id owner = self.parentController;
            if (!owner) {
                owner = self;
            }
            self.headerView = [[bundle loadNibNamed:self.xibName owner:owner options:nil] firstObject];
            
            if (self.creatingBlockWithPreheader) {
                self.creatingBlockWithPreheader(self, self.headerView, self.parentTableView, self.parentController);
            }
            
        } else {
            self.headerView = [[UIView alloc] initWithFrame:CGRectZero];
        }
        
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapSectionHeader:)];
        [self.headerView addGestureRecognizer:tapRecognizer];
        
        if (self.headerView) {
            [self headerDidCreated:self.headerView];
        }
    }
    return self.headerView;
}

- (void)tapSectionHeader:(UITapGestureRecognizer *)sendor {
    if (self.selectedBlock) {
        self.selectedBlock(self, self.headerView, self.parentTableView, self.parentController);
    }
}

@end
