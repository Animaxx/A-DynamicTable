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
        [self.tableView.form addRow:[SingleLineRowModel createWithText:[@"first - " stringByAppendingFormat:@"%d",i]]];
    }
    for (int i=0; i<20; i++) {
        [self.tableView.form addRow:[SingleLineRowModel createWithText:[@"second - " stringByAppendingFormat:@"%d",i]]];
    }
}

@end
