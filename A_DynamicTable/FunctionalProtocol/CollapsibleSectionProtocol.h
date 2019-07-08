//
//  CollapsibleSectionProtocol.h
//  A_DynamicTable
//
//  Created by Animax Deng on 6/19/19.
//  Copyright © 2019 Animax. All rights reserved.
//

/*
 To indicate the header has collapsible capability
 */
@protocol CollapsibleHeader

@required

/// Indicate the section state is now collapsed
@property (nonatomic) BOOL isCollapsed;

@end
