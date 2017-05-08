//
//  WDSliderView.m
//  TuYa
//
//  Created by 朱辉 on 2017/4/21.
//  Copyright © 2017年 jxx. All rights reserved.
//

#import "WDSliderView.h"

@interface WDSliderView()
@property(nonatomic,strong) UISlider *mySlider;

@end
@implementation WDSliderView


-(instancetype)init
{
    if (self = [super init]) {
        [self buildViews];
        
    }
    
    return  self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self buildViews];
    }
    return self;
}

-(void)buildViews
{
    _mySlider = [ [ UISlider alloc ] initWithFrame:CGRectMake(0,0,200 ,40) ];//高度设为40就好,高度代表手指触摸的高度.这个一定要注意
    _mySlider.minimumValue = 0.0;//下限
    _mySlider.maximumValue = 50.0;//上限
    _mySlider.value = 22.0;//开始默认值
    _mySlider.backgroundColor =[UIColor whiteColor];//测试用,
    UIImage *image = _mySlider.currentThumbImage;
    // ....
    
    [_mySlider setThumbImage:image forState:UIControlStateNormal];
    //[_mySlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    _mySlider.continuous = NO;//当放开手., 值才确定下来
    [ self addSubview:_mySlider ];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
