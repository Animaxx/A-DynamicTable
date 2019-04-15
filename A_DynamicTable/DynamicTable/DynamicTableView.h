//
//  DynamicTableView.h
//  A_DynamicTable
//
//  Created by Animax Deng on 3/19/18.
//  Copyright © 2018 Animax. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DynamicForm.h"
#import "DynamicRowModel.h"

@interface DynamicTableView : UITableView

@property (nonnull, strong, nonatomic) DynamicForm *form;

@end
