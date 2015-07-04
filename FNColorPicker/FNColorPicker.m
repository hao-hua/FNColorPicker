//
//  FNColorPicker.m
//  FNColorPickerDemo
//
//  Created by Fnoz on 15/7/2.
//  Copyright (c) 2015年 Fnoz. All rights reserved.
//

#import "FNColorPicker.h"
#import "FNImageView.h"

#define  selfX       self.frame.origin.x
#define  selfY       self.frame.origin.y
#define  selfWidth   self.frame.size.width
#define  selfHeight  self.frame.size.height

@interface FNColorPicker()

@property (nonatomic, strong) FNImageView *colorPanImgView;

@property (nonatomic, strong) UILabel *rrLabel;
@property (nonatomic, strong) UILabel *ggLabel;
@property (nonatomic, strong) UILabel *bbLabel;
@property (nonatomic, strong) UILabel *hLabel;
@property (nonatomic, strong) UILabel *sLabel;
@property (nonatomic, strong) UILabel *bLabel;

@end

@implementation FNColorPicker

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.layer setBorderColor:[_mainColor CGColor]];
    [self.layer setBorderWidth:0.5f];
    [self setFrame:CGRectMake(selfX, selfY, selfWidth, 1.5*selfWidth)];
    
    _colorPanImgView = [[FNImageView alloc] initWithFrame:CGRectMake(15, 15, selfWidth-30, selfWidth-30)];
    [_colorPanImgView.layer setCornerRadius:_colorPanImgView.frame.size.width/2.0];
    [_colorPanImgView setImage:[UIImage imageNamed:@"colorPanImg"]];
    [_colorPanImgView setParentView:self];
    [_colorPanImgView setUserInteractionEnabled:YES];
    [self addSubview:_colorPanImgView];
    
    _rrLabel = [[UILabel alloc] initWithFrame:CGRectMake(0+10, selfWidth, selfWidth/3.0-10, 0.25*selfWidth)];
    [_rrLabel setTextAlignment:NSTextAlignmentLeft];
    if (_r) {
        [_rrLabel setText:[NSString stringWithFormat:@"R %.1f",_r]];
    }
    else
    {
        [_rrLabel setText:@"R 0.0"];
    }
    [self addSubview:_rrLabel];
    
    _ggLabel = [[UILabel alloc] initWithFrame:CGRectMake(selfWidth/3.0+5, selfWidth, selfWidth/3.0-10, 0.25*selfWidth)];
    [_ggLabel setTextAlignment:NSTextAlignmentLeft];
    if (_g) {
        [_ggLabel setText:[NSString stringWithFormat:@"G %.1f",_g]];
    }
    else
    {
        [_ggLabel setText:@"G 0.0"];
    }
    [self addSubview:_ggLabel];
    
    _bbLabel = [[UILabel alloc] initWithFrame:CGRectMake(selfWidth*2/3.0, selfWidth, selfWidth/3.0-10, 0.25*selfWidth)];
    [_bbLabel setTextAlignment:NSTextAlignmentLeft];
    if (_b) {
        [_bbLabel setText:[NSString stringWithFormat:@"B %.1f",_b]];
    }
    else
    {
        [_bbLabel setText:@"B 0.0"];
    }
    [self addSubview:_bbLabel];
    
    _hLabel = [[UILabel alloc] initWithFrame:CGRectMake(0+10, 1.25*selfWidth, selfWidth/3.0-10, 0.25*selfWidth)];
    [_hLabel setTextAlignment:NSTextAlignmentLeft];
    if (_h) {
        [_hLabel setText:[NSString stringWithFormat:@"H %.1f",_h]];
    }
    else
    {
        [_hLabel setText:@"H 0.0"];
    }
    [self addSubview:_hLabel];
    
    _sLabel = [[UILabel alloc] initWithFrame:CGRectMake(selfWidth/3.0+5, 1.25*selfWidth, selfWidth/3.0-10, 0.25*selfWidth)];
    [_sLabel setTextAlignment:NSTextAlignmentLeft];
    if (_s) {
        [_sLabel setText:[NSString stringWithFormat:@"S %.1f",_s]];
    }
    else
    {
        [_sLabel setText:@"S 0.0"];
    }
    [self addSubview:_sLabel];
    
    _bLabel = [[UILabel alloc] initWithFrame:CGRectMake(selfWidth*2/3.0, 1.25*selfWidth, selfWidth/3.0-10, 0.25*selfWidth)];
    [_bLabel setTextAlignment:NSTextAlignmentLeft];
    [_bLabel setText:@"B 1.0"];
    [self addSubview:_bLabel];
    
    return self;
}

-(void)setMainColor:(UIColor *)mainColor
{
    [self.layer setBorderColor:[mainColor CGColor]];
    [_rrLabel setTextColor:mainColor];
    [_ggLabel setTextColor:mainColor];
    [_bbLabel setTextColor:mainColor];
    [_hLabel setTextColor:mainColor];
    [_sLabel setTextColor:mainColor];
    [_bLabel setTextColor:mainColor];
}

- (void)refreshLabelWithDic:(NSDictionary *)dic
{
    _r=[[dic objectForKey:@"r"] floatValue];
    _g=[[dic objectForKey:@"g"] floatValue];
    _b=[[dic objectForKey:@"b"] floatValue];
    _h=[[dic objectForKey:@"h"] floatValue];
    _s=[[dic objectForKey:@"s"] floatValue];
    [_rrLabel setText:[NSString stringWithFormat:@"R %.1f",_r]];
    [_ggLabel setText:[NSString stringWithFormat:@"G %.1f",_g]];
    [_bbLabel setText:[NSString stringWithFormat:@"B %.1f",_b]];
    [_hLabel setText:[NSString stringWithFormat:@"H %.1f",_h]];
    [_sLabel setText:[NSString stringWithFormat:@"S %.1f",_s]];
}

- (void)callBack:(NSDictionary *)dic
{
    [self refreshLabelWithDic:dic];
}

@end