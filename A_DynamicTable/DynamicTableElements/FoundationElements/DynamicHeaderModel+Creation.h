//
//  DynamicHeaderModel+Creation.h
//  A_DynamicTable
//
//  Created by Animax Deng on 6/18/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "DynamicHeaderModel.h"

NS_ASSUME_NONNULL_BEGIN

/*
 Extanded Creation functions for header models
 */
@interface DynamicHeaderModel (Creation)

+ (instancetype)dynamicHeaderWithBlock:(DynamicBeaderCreating)creationBlock;

+ (instancetype)dynamicHeaderWithBlock:(DynamicBeaderCreating)creationBlock action:(DynamicHeaderSelected)selectedAction;

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName;

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibNam
                              action:(DynamicHeaderSelected)selectedAction;

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName
                       creationBlock:(DynamicHeaderCreatingWithPreheader)creationBlock
                              action:(DynamicHeaderSelected)selectedAction;

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName
                            creation:(DynamicHeaderCreatingWithPreheader)creatingBlock;

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName
                              bundle:(NSBundle *)bundle
                            creation:(DynamicHeaderCreatingWithPreheader)creatingBlock;

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName
                              bundle:(NSBundle *)bundle
                            creation:(DynamicHeaderCreatingWithPreheader)creatingBlock
                              action:(DynamicHeaderSelected)selectedAction;

@end

NS_ASSUME_NONNULL_END
