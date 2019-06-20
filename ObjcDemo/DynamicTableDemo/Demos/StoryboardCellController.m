//
//  DemoStoryboardController.m
//  DynamicTableDemo
//
//  Created by Animax Deng on 4/14/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import <A_DynamicTable/A_DynamicTable.h>
#import "StoryboardCellController.h"
#import "StoryboardCustomCell.h"

@interface StoryboardCellController ()

@property (weak, nonatomic) IBOutlet DynamicTableView *tableView;

@end

@implementation StoryboardCellController

- (NSString *)title {
    return @"Create with storyboard";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add cells from storyboard with raw row model
    for (int i=0; i<20; i++) {
        
        [self.tableView.form addRow:[DynamicRowModel dynamicRowWithSBIdentifier:@"CellWithLabels" creation:^(DynamicRowModel * _Nonnull rowModel, UITableViewCell * _Nonnull cell, DynamicTableView * _Nonnull tableView, UIViewController * _Nonnull controller) {
            
            UILabel *label1 = [cell.contentView viewWithTag:1];
            if (label1 && [label1 isKindOfClass:[UILabel class]]) {
                [label1 setText:@"- Cell from storyboard with raw row model"];
            }
            
            [(UILabel *)[cell.contentView viewWithTag:2] setText:[NSString stringWithFormat:@"# %ld", (long)rowModel.pathIndex.row]];
        } action:^(DynamicRowModel * _Nonnull rowModel, UITableViewCell * _Nonnull cell, DynamicTableView * _Nonnull tableView, UIViewController * _Nonnull controller) {
            
            NSLog(@"On click model at %ld", (long)rowModel.pathIndex.row);
        }]];
    }
    
    // Add cells from storyboard with custom row model
    for (int i=0; i<20; i++) {
        [self.tableView.form addRow:[StoryboardCustomCell new]];
    }
    
}

@end
