//
//  CollapsibleHeader.h
//  A_DynamicTable
//
//  Created by Animax Deng on 4/4/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicBaseHeaderModel.h"

@interface CollapsibleHeader : DynamicBaseHeaderModel

@property (nonatomic, assign) BOOL isCollapsed;
- (void)triggerCollapsed;

@end
