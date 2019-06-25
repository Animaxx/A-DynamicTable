//
//  CollapsibleSectionProtocol.h
//  A_DynamicTable
//
//  Created by Animax Deng on 6/19/19.
//  Copyright © 2019 Animax. All rights reserved.
//

/// To enable collapsible capability for header
@protocol CollapsibleHeader

@required
/// Record if the section is collapsed
@property (nonatomic) BOOL isCollapsed;

@end
