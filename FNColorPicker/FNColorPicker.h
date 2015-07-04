//
//  FNColorPicker.h
//  FNColorPickerDemo
//
//  Created by Fnoz on 15/7/2.
//  Copyright (c) 2015年 Fnoz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNColorPicker : UIView

@property (nonatomic, strong) UIViewController *parentViewController;
@property (nonatomic, strong) UIColor *mainColor;
@property (nonatomic, assign) CGFloat r;
@property (nonatomic, assign) CGFloat g;
@property (nonatomic, assign) CGFloat b;
@property (nonatomic, assign) CGFloat h;
@property (nonatomic, assign) CGFloat s;

- (void)callBack:(NSDictionary *)dic;

@end
