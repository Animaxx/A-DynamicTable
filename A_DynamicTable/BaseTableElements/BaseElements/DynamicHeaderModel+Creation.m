//
//  DynamicHeaderModel+Creation.m
//  A_DynamicTable
//
//  Created by Animax Deng on 6/18/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "DynamicHeaderModel+Creation.h"

@implementation DynamicHeaderModel (Creation)

+ (instancetype)dynamicHeaderWithBlock:(DynamicBeaderCreating)creationBlock {
    
    DynamicHeaderModel *model = [[[self class] alloc] init];
    [model setCreatingBlock:creationBlock];
    
    return model;
}

+ (instancetype)dynamicHeaderWithBlock:(DynamicBeaderCreating)creationBlock action:(DynamicHeaderSelected)selectedAction {
    DynamicHeaderModel *model = [[[self class] alloc] init];
    [model setCreatingBlock:creationBlock];
    [model setSelectedBlock:selectedAction];
    
    return model;
}

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName {
    
    DynamicHeaderModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    
    return model;
}

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName
                             action:(DynamicHeaderSelected)selectedAction {
    
    DynamicHeaderModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setSelectedBlock:selectedAction];
    
    return model;
}

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName
                      creationBlock:(DynamicHeaderCreatingWithPreheader)creationBlock
                             action:(DynamicHeaderSelected)selectedAction {
    
    DynamicHeaderModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setCreatingBlockWithPreheader:creationBlock];
    [model setSelectedBlock:selectedAction];
    
    return model;
}

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName
                           creation:(DynamicHeaderCreatingWithPreheader)creatingBlock {
    
    DynamicHeaderModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setCreatingBlockWithPreheader:creatingBlock];
    
    return model;
}

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName
                             bundle:(NSBundle *)bundle
                           creation:(DynamicHeaderCreatingWithPreheader)creatingBlock {
    
    DynamicHeaderModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setHeaderBundle:bundle];
    [model setCreatingBlockWithPreheader:creatingBlock];
    
    return model;
}

+ (instancetype)dynamicHeaderWithXIB:(NSString *)xibName
                             bundle:(NSBundle *)bundle
                           creation:(DynamicHeaderCreatingWithPreheader)creatingBlock
                             action:(DynamicHeaderSelected)selectedAction {
    
    DynamicHeaderModel *model = [[[self class] alloc] init];
    [model setXibName:xibName];
    [model setHeaderBundle:bundle];
    [model setCreatingBlockWithPreheader:creatingBlock];
    [model setSelectedBlock:selectedAction];
    
    return model;
}

@end
