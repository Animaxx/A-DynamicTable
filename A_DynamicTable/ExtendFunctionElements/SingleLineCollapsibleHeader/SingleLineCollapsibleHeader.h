//
//  SingleLineCollapsibleHeader.h
//  A_DynamicTable
//
//  Created by Animax Deng on 4/4/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicHeaderModel.h"
#import "BasicCollapsibleHeader.h"

@interface SingleLineCollapsibleHeader : BasicCollapsibleHeader

+ (instancetype)createWithText:(NSString *)text;
+ (instancetype)createWithText:(NSString *)text titleColor:(UIColor *)titleColor backgoundColor:(UIColor *)backgoundColor;

@end
