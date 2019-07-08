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
    
    NSArray *demoList = @[@"Demo create rows with storyboard",
                          @"Demo create rows with built in model",
                          @"Demo create rows with XIB",
                          @"Demo collapsible header",
                          @"Demo custom Collapsible header"];
    
    NSDictionary *dic = @{demoList[0]: @"StoryboardCellController",
                          demoList[1]: @"NormalSectionController",
                          demoList[2]: @"XIBCellViewController",
                          demoList[3]: @"CollapsibleSectionController",
                          demoList[4]: @"CustomCollapsibleSectionController"
                          };
    
    for (NSString *k in demoList) {
        DynamicRowModel *row = [DynamicRowModel dynamicRowWithSBIdentifier:@"cell"];
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
