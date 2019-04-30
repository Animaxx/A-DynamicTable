//
//  StoryboardCustomCell.m
//  DynamicTableDemo
//
//  Created by Animax Deng on 4/29/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "StoryboardCustomCell.h"

@interface StoryboardCustomCell()

@end

@implementation StoryboardCustomCell

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.SBIdentifier = @"CustomRowCellWithLabels";
        self.cellBundle = [NSBundle bundleForClass:[self class]];
    }
    return self;
}

- (void)setup {
    
}
- (void)cellDidLoad:(UITableViewCell *)cell {
    UILabel *label1 = [cell.contentView viewWithTag:1];
    UILabel *label2 = [cell.contentView viewWithTag:2];
    
    [label1 setText:[NSString stringWithFormat:@"Custom Cell Label %ld", (long)self.pathIndex.row]];
    [label2 setText:@"- Custom Dynamic Row Model"];
}
- (void)onRowSelected {
    NSLog(@"on click custom model at %ld", (long)self.pathIndex.row);
}

@end
