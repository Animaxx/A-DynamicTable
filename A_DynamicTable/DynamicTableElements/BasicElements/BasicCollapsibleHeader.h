//
//  BasicCollapsibleHeader.h
//  A_DynamicTable
//
//  Created by Animax Deng on 7/7/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "DynamicHeaderModel.h"
#import "CollapsibleSectionProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface BasicCollapsibleHeader : DynamicHeaderModel <CollapsibleHeader>

@property (nonatomic, assign) BOOL isCollapsed;

/// On change collapsed state event for overwrite
/// @param model currect header
/// @param state isColleapsed
- (void)onChangedCollapsedState:(BasicCollapsibleHeader *)model state:(BOOL)state;

@end

NS_ASSUME_NONNULL_END
