//
//  DynamicRowModel+Creation.m
//  A_DynamicTable
//
//  Created by Animax Deng on 6/18/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "DynamicRowModel+Creation.h"

@implementation DynamicRowModel (Creation)

+ (instancetype)dynamicRowWithBlock:(DynamicRowCellCreateBlock)creationBlock action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setCellCreateBlock:creationBlock];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)dynamicRowWithXIB:(NSString *)xibName {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    
    return model;
}

+ (instancetype)dynamicRowWithXIB:(NSString *)xibName
                          bundle:(NSBundle *)bundle {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setCellBundle:bundle];
    
    return model;
}

+ (instancetype)dynamicRowWithXIB:(NSString *)xibName
                          bundle:(NSBundle *)bundle
                          action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setCellBundle:bundle];
    [model setXibName:xibName];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)dynamicRowWithXIB:(NSString *)xibName
                          bundle:(NSBundle *)bundle
                     cellDidLoad:(DynamicRowCellDidLoadBlock)cellDidLoadBlock
                          action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setCellBundle:bundle];
    [model setXibName:xibName];
    [model setCellDidLoadBlock:cellDidLoadBlock];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)dynamicRowWithXIB:(NSString *)xibName
                     cellDidLoad:(DynamicRowCellDidLoadBlock)cellDidLoadBlock
                          action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setCellDidLoadBlock:cellDidLoadBlock];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)dynamicRowWithXIB:(NSString *)xibName
                          action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)dynamicRowWithSBIdentifier:(NSString *)Identifier {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setSBIdentifier:Identifier];
    
    return model;
}

+ (instancetype)dynamicRowWithSBIdentifier:(NSString *)Identifier
                                 creation:(DynamicRowCellDidLoadBlock)creatingBlock
                                   action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setSBIdentifier:Identifier];
    [model setCellDidLoadBlock: creatingBlock];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}

+ (instancetype)dynamicRowWithSBIdentifier:(NSString *)Identifier
                                   action:(DynamicRowSelectedBlock)selectedBlock {
    DynamicRowModel *model = [[[self class] alloc] init];
    [model setSBIdentifier:Identifier];
    [model setCellSelectedBlock:selectedBlock];
    
    return model;
}


@end
