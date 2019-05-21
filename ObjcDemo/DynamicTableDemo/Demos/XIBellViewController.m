//
//  XIBCellViewController.m
//  DynamicTableDemo
//
//  Created by Animax Deng on 5/18/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "XIBCellViewController.h"
#import <A_DynamicTable/A_DynamicTable.h>

@interface XIBCellViewController ()

@property (weak, nonatomic) IBOutlet DynamicTableView *tableView;

@end

@implementation XIBCellViewController

- (NSString *)title {
    return @"XIB Cell Demo";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i=0; i<20; i++) {
        [self.tableView.form addRow: [DynamicRowModel createRowWithXIB:@"CustomXIBCell" bundle:[NSBundle mainBundle] cellDidLoad:^(DynamicRowModel * _Nonnull rowModel, UITableViewCell * _Nonnull cell, DynamicTableView * _Nonnull tableView, UIViewController * _Nonnull controller) {
            
            UILabel *firstLabel = [cell.contentView viewWithTag:1];
            UILabel *secondLabel = [cell.contentView viewWithTag:2];
            
            [firstLabel setText:@"Custom XIB cell"];
            [secondLabel setText:[NSString stringWithFormat:@"ID %d", i]];
            
        } action:nil]];
    }
}


@end
