//
//  SingleLineCollapsibleHeader.m
//  A_DynamicTable
//
//  Created by Animax Deng on 4/4/19.
//  Copyright © 2018 Animax. All rights reserved.
//

#import "SingleLineCollapsibleHeader.h"
#import "DynamicTableView.h"

@implementation SingleLineCollapsibleHeader {
    NSString *_titleText;
    UIColor *_titleColor;
    UIColor *_backgroundColor;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [super setHeaderBundle:[NSBundle bundleForClass:[self class]]];
        [super setXibName:@"SingleLineHeader"];
    }
    return self;
}

- (void)headerDidCreated:(UIView *)header {
    UILabel *label = [header viewWithTag:1];
    [label setText:self->_titleText];
    if (self->_titleColor) {
        [label setTextColor:self->_titleColor];
    }
    if (self->_backgroundColor) {
        [header setBackgroundColor:self->_backgroundColor];
    }
}

+ (instancetype)createWithText:(NSString *)text {
    SingleLineCollapsibleHeader *model = [[SingleLineCollapsibleHeader alloc] init];
    model->_titleText = text;
    return model;
}
+ (instancetype)createWithText:(NSString *)text titleColor:(UIColor *)titleColor backgoundColor:(UIColor *)backgoundColor {
    
    SingleLineCollapsibleHeader *model = [[SingleLineCollapsibleHeader alloc] init];
    model->_titleText = text;
    model->_titleColor = titleColor;
    model->_backgroundColor = backgoundColor;
    return model;
}


@end
