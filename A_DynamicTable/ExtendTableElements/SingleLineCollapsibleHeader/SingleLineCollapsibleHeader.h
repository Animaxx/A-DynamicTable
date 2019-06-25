//
//  SingleLineCollapsibleHeader.h
//  A_DynamicTable
//
//  Created by Animax Deng on 4/4/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicHeaderModel.h"
#import "CollapsibleSectionProtocol.h"

@interface SingleLineCollapsibleHeader : DynamicHeaderModel <CollapsibleHeader>

@property (nonatomic, assign) BOOL isCollapsed;

+ (instancetype)createWithText:(NSString *)text;
+ (instancetype)createWithText:(NSString *)text titleColor:(UIColor *)titleColor backgoundColor:(UIColor *)backgoundColor;

@end
