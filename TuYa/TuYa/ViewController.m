//
//  ViewController.m
//  TuYa
//
//  Created by 朱辉 on 2017/4/21.
//  Copyright © 2017年 jxx. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    WDPactureView *drawPicView ;
}
@property (nonatomic, strong) WDDrawPictureModel *modle;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self creatView];
}

-(void)creatView
{
    _modle = [[WDDrawPictureModel alloc] init];
    
    CGRect setRect = CGRectMake(20, 64+20, ScreenWidth - 40, 120);
    UIView *setView = [[UIView alloc] init];
    setView.frame = setRect;
    setView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:setView];
    
    UILabel *setw = [UILabel creatNormalLableWithText:@"画笔宽度:" frame:CGRectMake(0, 10, 70, 20)];
    [setView addSubview:setw];
    
    CGRect colorRect = RECT(0,MAX_Y(setw.frame, 3), 70, 20);
    UILabel *setColor = [UILabel creatNormalLableWithText:@"画笔颜色:" frame:colorRect];
    [setView addSubview:setColor];
    
    CGRect RRect = RECT(0, MAX_Y(setColor.frame, 3), 20, 20);
    UILabel *R = [UILabel creatNormalLableWithText:@"R:" frame:RRect];
    [setView addSubview:R];
    
    CGRect GRect = RECT(0, MAX_Y(R.frame, 3), 20, 20);
    UILabel *G = [UILabel creatNormalLableWithText:@"G:" frame:GRect];
    [setView addSubview:G];
    
    CGRect BRect = RECT(0, MAX_Y(G.frame, 3), 20, 20);
    UILabel *B = [UILabel creatNormalLableWithText:@"B:" frame:BRect];
    [setView addSubview:B];
    
    UISlider *slider_w = [[UISlider alloc] init];
    slider_w.frame = CGRectMake(CGRectGetMaxX(setw.frame) + 3, 15, 160, 10);
    slider_w.minimumValue = 0.0;
    slider_w.maximumValue = 50.0;
    slider_w.value = 10.0;
    [slider_w addTarget:self action:@selector(widthSliderChanged:) forControlEvents:UIControlEventValueChanged];
    slider_w.tag = 11;
    [setView addSubview:slider_w];
    
    
    UISlider *RSlider = [[UISlider alloc] init];
    RSlider.frame = RECT(MAX_X(R.frame, 3), MAX_Y(R.frame, -15), 100, 10);
    RSlider.minimumValue = 0.0;//下限
    RSlider.maximumValue = 255.0;//上限
    RSlider.value = 0.0;//开始默认值
    RSlider.continuous = YES;//滑动即响应
    [RSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    RSlider.tag = 0;
    [setView addSubview:RSlider];
    
    UISlider *GSlider = [[UISlider alloc] init];
    GSlider.frame = RECT(MAX_X(G.frame, 3), MAX_Y(G.frame, -15), 100, 10);
    GSlider.minimumValue = 0.0;//下限
    GSlider.maximumValue = 255.0;//上限
    GSlider.value = 0.0;//开始默认值
    GSlider.continuous = YES;//滑动即响应
    [GSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    GSlider.tag = 1;
    [setView addSubview:GSlider];
    
    UISlider *BSlider = [[UISlider alloc] init];
    BSlider.frame = RECT(MAX_X(B.frame, 3), MAX_Y(B.frame, -15), 100, 10);
    BSlider.minimumValue = 0.0;//下限
    BSlider.maximumValue = 255.0;//上限
    BSlider.value = 0.0;//开始默认值
    BSlider.continuous = YES;//滑动即响应
    [BSlider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
    BSlider.tag = 2;
    [setView addSubview:BSlider];
    
    
    
    CGRect rect = CGRectMake(20,CGRectGetMaxY(setView.frame) + 10, ScreenWidth - 40, 40);
    UIView *toolView = [[UIView alloc] initWithFrame:rect];
    toolView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:toolView];
    
    UIButton *btnUndo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnUndo.backgroundColor = [UIColor orangeColor];
    btnUndo.frame = CGRectMake(0, 10, 60, 20);
    [btnUndo setTitle:@"撤销" forState:UIControlStateNormal];
    [btnUndo addTarget:self action:@selector(btnUndoClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:btnUndo];

    
    UIButton *btnClean = [UIButton buttonWithType:UIButtonTypeCustom];
    btnClean.backgroundColor = [UIColor orangeColor];
    btnClean.frame =  CGRectMake(CGRectGetMaxX(btnUndo.frame) + 20, 10, 60, 20);
    [btnClean setTitle:@"清空" forState:UIControlStateNormal];
    [btnClean addTarget:self action:@selector(btnClearClicked:) forControlEvents:UIControlEventTouchUpInside];
    [toolView addSubview:btnClean];

    
    self.view.backgroundColor = RGB(200, 200, 200);
    drawPicView = [[WDPactureView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(toolView.frame) + 20, ScreenWidth , 300)];
    drawPicView.pencleWidth = slider_w.value;
    drawPicView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:drawPicView];
}
-(void)widthSliderChanged:(UISlider *)slider
{
    drawPicView.pencleWidth = slider.value;
}

-(void)sliderChanged:(UISlider *)slider
{
    if (slider.tag == 0) {
        
        _modle.color_R = slider.value;
    }else if (slider.tag == 1){
        _modle.color_G = slider.value;
    }else{
        _modle.color_B = slider.value;
    }
    [self colorChanged];

}

-(void)colorChanged
{
    drawPicView.pencleColor = RGB(_modle.color_R, _modle.color_G, _modle.color_B);
}
-(void)btnUndoClicked:(UIButton *)btn
{
    [drawPicView preStep];
}

-(void)btnClearClicked:(UIButton *)btn
{
    [drawPicView clearAllStep];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
