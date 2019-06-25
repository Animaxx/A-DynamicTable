//
//  SingleLineRowModel.h
//  A_DynamicTable
//
//  Created by Animax Deng on 4/6/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicRowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SingleLineRow : DynamicRowModel

+ (SingleLineRow *)createWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
