//
//  BasicEmptyHeader.h
//  A_DynamicTable
//
//  Created by Animax Deng on 2/12/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicHeaderModel.h"

/*
 Empty header with 0 height, default header for dynamic tableview
 */
@interface BasicEmptyHeader : DynamicHeaderModel

+ (instancetype)create;

@end
