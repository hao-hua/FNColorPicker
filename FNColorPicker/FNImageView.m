//
//  FNImageView.m
//  FNColorPickerDemo
//
//  Created by Fnoz on 15/7/2.
//  Copyright (c) 2015年 Fnoz. All rights reserved.
//

#import "FNImageView.h"
#import "FNImageViewSelectView.h"
#import "FNColorPicker.h"

#define selectRatio 0.91

@implementation FNImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    FNImageViewSelectView *selectView = [[FNImageViewSelectView alloc] initWithFrame:CGRectMake(0, 0, selectRatio * self.frame.size.width, selectRatio * self.frame.size.height)];
    [selectView setParentView:self];
    [selectView.layer setCornerRadius:0.5*selectRatio * self.frame.size.width];
    [selectView setBackgroundColor:[UIColor clearColor]];
    [selectView setCenter:CGPointMake(0.5*self.frame.size.width, 0.5*self.frame.size.width)];
    [self addSubview:selectView];
    
    return self;
}

- (void)callBack:(NSDictionary *)dic
{
    [(FNColorPicker *)self.parentView callBack:dic];
}

@end
