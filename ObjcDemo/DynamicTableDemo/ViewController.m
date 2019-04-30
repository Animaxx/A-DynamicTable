//
//  ViewController.m
//  DynamicTableDemo
//
//  Created by Animax Deng on 4/5/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "ViewController.h"
#import <A_DynamicTable/A_DynamicTable.h>
#import "StoryboardCellController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet DynamicTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSDictionary *dic = @{@"Demo create from storyboard": @"DemoStoryboardController"};
    
    for (NSString *k in dic) {
        DynamicRowModel *row = [DynamicRowModel createRowWithSBIdentifier:@"cell"];
        [row setCellDidLoadBlock:^(DynamicRowModel * _Nonnull rowModel, UITableViewCell * _Nonnull cell, DynamicTableView * _Nonnull tableView, UIViewController * _Nonnull controller) {
            [cell.textLabel setText:k];
            [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
        }];
        [row setCellSelectedBlock:^(DynamicRowModel * _Nonnull rowModel, UITableViewCell * _Nonnull cell, DynamicTableView * _Nonnull tableView, UIViewController * _Nonnull controller) {
            
            UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:[dic objectForKey:k]];
            [self.navigationController pushViewController:vc animated:YES];
        }];
        [self.tableView.form addRow:row];
    }
}


@end
