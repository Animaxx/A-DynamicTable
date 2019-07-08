//
//  SingleLineRowModel.m
//  A_DynamicTable
//
//  Created by Animax Deng on 4/6/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "SingleLineRow.h"

@implementation SingleLineRow {
    NSString *lineText;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (SingleLineRow *)createWithText:(NSString *)text {
    SingleLineRow *row = [[SingleLineRow alloc] init];
    row->lineText = text;
    return row;
}


- (void)cellDidLoad:(UITableViewCell *)cell {
    [cell.textLabel setText:self->lineText];
}

@end
