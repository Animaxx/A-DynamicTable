//
//  SingleLineHeaderModel.h
//  A_DynamicTable
//
//  Created by Animax Deng on 4/6/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicHeaderModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SingleLineHeaderModel : DynamicHeaderModel

+ (instancetype)createWithText:(NSString *)text;
+ (instancetype)createWithText:(NSString *)text titleColor:(UIColor *)titleColor backgoundColor:(UIColor *)backgoundColor;

@end

NS_ASSUME_NONNULL_END
