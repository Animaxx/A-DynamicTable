//
//  CollapsibleSectionController.m
//  DynamicTableDemo
//
//  Created by Animax Deng on 6/19/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "CollapsibleSectionController.h"
#import <A_DynamicTable/A_DynamicTable.h>

@interface CollapsibleSectionController ()

@property (weak, nonatomic) IBOutlet DynamicTableView *tableView;

@end

@implementation CollapsibleSectionController

- (NSString *)title {
    return @"Normal Section Usage Demo";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView.form addSection:[SingleLineHeaderModel createWithText:@"First Header"
                                                               titleColor:[UIColor blackColor]
                                                           backgoundColor:[UIColor lightGrayColor]]];
    for (int i=0; i<20; i++) {
        [self.tableView.form addRow:[SingleLineRowModel createWithText:[@"first - " stringByAppendingFormat:@"%d",i]]];
    }
    
    [self.tableView.form addSection:[SingleLineHeaderModel createWithText:@"Second Header"
                                                               titleColor:[UIColor blackColor]
                                                           backgoundColor:[UIColor lightGrayColor]]];
    for (int i=0; i<20; i++) {
        [self.tableView.form addRow:[SingleLineRowModel createWithText:[@"second - " stringByAppendingFormat:@"%d",i]]];
    }
}

@end
