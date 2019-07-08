//
//  CustomCollapsibleSectionController.m
//  DynamicTableDemo
//
//  Created by Animax Deng on 7/7/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import <A_DynamicTable/A_DynamicTable.h>
#import "CustomCollapsibleSectionController.h"
#import "StoryboardCustomCollapsibleHeader.h"

@interface CustomCollapsibleSectionController ()

@property (weak, nonatomic) IBOutlet DynamicTableView *tableView;

@end

@implementation CustomCollapsibleSectionController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView.form addSection:[StoryboardCustomCollapsibleHeader createWithTitle:@"First Header"]];
    
    for (int i=0; i<10; i++) {
        [self.tableView.form addRow:[SingleLineRow createWithText:[@"first - " stringByAppendingFormat:@"%d",i]]];
    }
    
    [self.tableView.form addSection:[StoryboardCustomCollapsibleHeader createWithTitle:@"Second Header"]];
    
    for (int i=0; i<10; i++) {
        [self.tableView.form addRow:[SingleLineRow createWithText:[@"second - " stringByAppendingFormat:@"%d",i]]];
    }
}



@end
