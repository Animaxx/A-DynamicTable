//
//  DynamicGroupHeader.h
//  A_DynamicTable
//
//  Created by Animax Deng on 2/12/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DynamicHeaderModel.h"

@interface DynamicSectionGroupHeader : DynamicHeaderModel

@property (nonatomic, strong) NSString *sectionName;

- (instancetype)setSectionTitle:(NSString *)name;

@end
