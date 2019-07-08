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
    
    [self.tableView.form addSection:[SingleLineCollapsibleHeader createWithText:@"First Header" titleColor:[UIColor blackColor] backgoundColor:[UIColor lightGrayColor]]];
    
    for (int i=0; i<10; i++) {
        [self.tableView.form addRow:[SingleLineRow createWithText:[@"first - " stringByAppendingFormat:@"%d",i]]];
    }
    
    [self.tableView.form addSection:[SingleLineCollapsibleHeader createWithText:@"Second Header" titleColor:[UIColor blackColor] backgoundColor:[UIColor lightGrayColor]]];
    
    for (int i=0; i<10; i++) {
        [self.tableView.form addRow:[SingleLineRow createWithText:[@"second - " stringByAppendingFormat:@"%d",i]]];
    }
}

@end
