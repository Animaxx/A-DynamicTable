//
//  DynamicRowModel+Creation.h
//  A_DynamicTable
//
//  Created by Animax Deng on 6/18/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "DynamicRowModel.h" d

NS_ASSUME_NONNULL_BEGIN

@interface DynamicRowModel (Creation)

#pragma mark - Create cell from code
+ (nonnull instancetype)dynamicRowWithBlock:(nonnull DynamicRowCellCreateBlock)creationBlock
                                    action:(nonnull DynamicRowSelectedBlock)selectedBlock;

#pragma mark - Create cell from XIB
+ (nonnull instancetype)dynamicRowWithXIB:(nonnull NSString *)xibName;

+ (nonnull instancetype)dynamicRowWithXIB:(nonnull NSString *)xibName
                                  bundle:(nonnull NSBundle *)bundle;

+ (nonnull instancetype)dynamicRowWithXIB:(nonnull NSString *)xibName
                                  bundle:(nonnull NSBundle *)bundle
                                  action:(nullable DynamicRowSelectedBlock)selectedBlock;

+ (nonnull instancetype)dynamicRowWithXIB:(nonnull NSString *)xibName
                                  bundle:(nonnull NSBundle *)bundle
                             cellDidLoad:(nonnull DynamicRowCellDidLoadBlock)cellDidLoadBlock
                                  action:(nullable DynamicRowSelectedBlock)selectedBlock;

+ (nonnull instancetype)dynamicRowWithXIB:(nonnull NSString *)xibName
                             cellDidLoad:(nonnull DynamicRowCellDidLoadBlock)cellDidLoadBlock
                                  action:(nullable DynamicRowSelectedBlock)selectedBlock;

+ (nonnull instancetype)dynamicRowWithXIB:(nonnull NSString *)xibName
                                  action:(nullable DynamicRowSelectedBlock)selectedBlock;


#pragma mark - Create cell from Storyboard Table Cell
+ (nonnull instancetype)dynamicRowWithSBIdentifier:(nonnull NSString *)Identifier;

+ (nonnull instancetype)dynamicRowWithSBIdentifier:(nonnull NSString *)Identifier
                                         creation:(nonnull DynamicRowCellDidLoadBlock)creatingBlock
                                           action:(nonnull DynamicRowSelectedBlock)selectedBlock;

+ (nonnull instancetype)dynamicRowWithSBIdentifier:(nonnull NSString *)Identifier
                                           action:(nonnull DynamicRowSelectedBlock)selectedBlock;

@end

NS_ASSUME_NONNULL_END
