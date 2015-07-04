//
//  FNImageViewSelectView.m
//  FNColorPickerDemo
//
//  Created by Fnoz on 15/7/2.
//  Copyright (c) 2015年 Fnoz. All rights reserved.
//

#import "FNImageViewSelectView.h"

@implementation FNImageViewSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _whiteCircle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10.0f, 10.0f)];
        [_whiteCircle.layer setBorderWidth:1.5f];
        [_whiteCircle.layer setCornerRadius:5.0f];
        [_whiteCircle.layer setBorderColor:[[UIColor whiteColor] CGColor]];
        [_whiteCircle setBackgroundColor:[UIColor clearColor]];
        [_whiteCircle setCenter:CGPointMake(self.frame.size.width/2.0, self.frame.size.height/2.0)];
        [self addSubview:_whiteCircle];
    }
    return self;
}

#pragma mark -
#pragma mark - UITouchDelegate
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handlePouchSet:touches];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handlePouchSet:touches];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self handlePouchSet:touches];
}

- (void)handlePouchSet:(NSSet *)touchSet
{
    CGPoint touchPoint = CGPointZero;
    for (id obj in touchSet) {
        if ([obj isKindOfClass:[UITouch class]]) {
            UITouch *touch = (UITouch *)obj;
            touchPoint = [touch locationInView:self];
        }
    }
    float radius = sqrt((touchPoint.x-self.frame.size.width/2)*(touchPoint.x-self.frame.size.width/2)+(touchPoint.y-self.frame.size.width/2)*(touchPoint.y-self.frame.size.width/2));
    if(radius>self.frame.size.width/2)
    {
        return;
    }
    
    [self.whiteCircle setCenter:touchPoint];
    
    float relativeX = touchPoint.x-self.frame.size.width/2;
    float relativeY = touchPoint.y-self.frame.size.height/2;
    float hue = [self getHueWithRadius:self.frame.size.height/2 PointX:relativeX PointY:relativeY];
    float saturation = sqrtf(relativeX*relativeX+relativeY*relativeY)/(self.frame.size.height/2);
    float rr,gg,bb;
    HSBtoRGB(hue, saturation, 1, &rr, &gg, &bb);
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:[NSNumber numberWithFloat:rr] forKey:@"r"];
    [dic setObject:[NSNumber numberWithFloat:gg] forKey:@"g"];
    [dic setObject:[NSNumber numberWithFloat:bb] forKey:@"b"];
    [dic setObject:[NSNumber numberWithFloat:hue] forKey:@"h"];
    [dic setObject:[NSNumber numberWithFloat:saturation] forKey:@"s"];
    [self callBack:dic];
    NSLog(@"%@",dic);
}

- (float)getHueWithRadius:(float)radius PointX:(float)x PointY:(float)y
{
    float hue;
    if (x==0)
    {
        if (y>=0)
            hue = 0;
        else
            hue = 180;
        return hue;
    }
    else
    {
        float a,b,c;
        a = sqrtf(x*x+y*y);
        b = sqrtf(x*x+(radius-y)*(radius-y));
        c = radius;
        float CosB=(c*c-b*b+a*a)/(2*a*c);
        if(x>0)
            hue = acosf(CosB)/(2*3.14159265758)*360.0;
        else
            hue = 360.0-acosf(CosB)/(2*3.14159265758)*360.0;
    }
    if(hue+180>=360)
        hue -= 180;
    else
        hue += 180;
    return hue;
}

static void HSBtoRGB(float hue, float sat, float bri, float *red ,float *green ,float *blue)
{
    float rgb[3]={0,0,0};
    for(int offset=240,i=0;i<3;i++,offset-=120) {
        float x = abs(((int)hue+offset)%360-240);
        if(x<=60) rgb[i]=255;
        else if(60<x && x<120) rgb[i]=((1-(x-60)/60)*255);
        else rgb[i]=0;
    }
    for(int i=0;i<3;i++)
        rgb[i]+=(255-rgb[i])*(1-sat);
    for(int i=0;i<3;i++)
        rgb[i]*=bri;
    *red = rgb[0];
    *green = rgb[1];
    *blue = rgb[2];
}

- (void)callBack:(NSDictionary *)dic
{
    [(FNImageViewSelectView *)self.parentView callBack:dic];
}

@end
