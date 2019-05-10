//
//  NormalSectionController.m
//  DynamicTableDemo
//
//  Created by Animax Deng on 4/29/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "NormalSectionController.h"
#import <A_DynamicTable/A_DynamicTable.h>

@interface NormalSectionController ()

@property (weak, nonatomic) IBOutlet DynamicTableView *tableView;

@end

@implementation NormalSectionController

- (NSString *)title {
    return @"Normal Section Usage Demo";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0; i<20; i++) {
        [self.tableView.form addRow:[SingleLineRowModel createWithText:@"test"]];
        
//        [self.tableView.form addRow:[DynamicRowModel createRowWithSBIdentifier:@"CellWithLabels" creation:^(DynamicRowModel * _Nonnull rowModel, UITableViewCell * _Nonnull cell, DynamicTableView * _Nonnull tableView, UIViewController * _Nonnull controller) {
//
//            UILabel *label1 = [cell.contentView viewWithTag:1];
//            if (label1 && [label1 isKindOfClass:[UILabel class]]) {
//                [label1 setText:@"- Cell from storyboard with raw row model"];
//            }
//
//            [(UILabel *)[cell.contentView viewWithTag:2] setText:[NSString stringWithFormat:@"# %ld", (long)rowModel.pathIndex.row]];
//        } action:^(DynamicRowModel * _Nonnull rowModel, UITableViewCell * _Nonnull cell, DynamicTableView * _Nonnull tableView, UIViewController * _Nonnull controller) {
//
//            NSLog(@"On click model at %ld", (long)rowModel.pathIndex.row);
//
//        }]];
    }
}

@end
