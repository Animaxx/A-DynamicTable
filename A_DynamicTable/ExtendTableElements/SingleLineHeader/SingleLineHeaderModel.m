//
//  SingleLineHeaderModel.m
//  A_DynamicTable
//
//  Created by Animax Deng on 4/6/19.
//  Copyright © 2019 Animax. All rights reserved.
//

#import "SingleLineHeaderModel.h"

@implementation SingleLineHeaderModel {
    NSString *_titleText;
    UIColor *_titleColor;
    UIColor *_backgroundColor;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [super setHeaderBundle:[NSBundle bundleForClass:[self class]]];
        [super setXibName:@"SingleLineHeaderModel"];
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
    SingleLineHeaderModel *model = [[SingleLineHeaderModel alloc] init];
    model->_titleText = text;
    return model;
}
+ (instancetype)createWithText:(NSString *)text titleColor:(UIColor *)titleColor backgoundColor:(UIColor *)backgoundColor {
    SingleLineHeaderModel *model = [[SingleLineHeaderModel alloc] init];
    model->_titleText = text;
    model->_titleColor = titleColor;
    model->_backgroundColor = backgoundColor;
    return model;
}



@end
