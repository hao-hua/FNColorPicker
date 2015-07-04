//
//  ViewController.m
//  FNColorPickerDemo
//
//  Created by Fnoz on 15/7/2.
//  Copyright (c) 2015年 Fnoz. All rights reserved.
//

#import "ViewController.h"
#import "FNColorPicker.h"

#define   BLUE   [UIColor colorWithRed:38.0f/255.0f green:145.0/255.0f blue:244.0f/255.0f alpha:1.0f]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    FNColorPicker *fnColorPicker = [[FNColorPicker alloc] initWithFrame:CGRectMake(50, 40, self.view.frame.size.width-100, 1.5*(self.view.frame.size.width-100))];
    [fnColorPicker setCenter:self.view.center];
    [fnColorPicker.layer setCornerRadius:10.0];
    [fnColorPicker setMainColor:BLUE];
    [self.view addSubview:fnColorPicker];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
