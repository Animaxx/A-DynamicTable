//
//  SingleLineRowModel.m
//  A_DynamicTable
//
//  Created by Animax Deng on 4/6/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "SingleLineRowModel.h"

@implementation SingleLineRowModel {
    NSString *lineText;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (SingleLineRowModel *)createWithText:(NSString *)text {
    SingleLineRowModel *row = [[SingleLineRowModel alloc] init];
    row->lineText = text;
    return row;
}


- (void)cellDidLoad:(UITableViewCell *)cell {
    [cell.textLabel setText:self->lineText];
}

@end
