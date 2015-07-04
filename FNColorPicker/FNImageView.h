//
//  FNImageView.h
//  FNColorPickerDemo
//
//  Created by Fnoz on 15/7/2.
//  Copyright (c) 2015年 Fnoz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FNImageView : UIImageView

@property (nonatomic, strong) UIView *parentView;

- (void)callBack:(NSDictionary *)dic;

@end
