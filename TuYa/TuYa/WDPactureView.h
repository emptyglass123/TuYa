//
//  WDPactureView.h
//  TuYa
//
//  Created by 朱辉 on 2017/4/21.
//  Copyright © 2017年 jxx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WDPactureView : UIView
@property (nonatomic, strong) UIColor  *pencleColor; //画笔颜色
@property (nonatomic, assign) CGFloat pencleWidth;   //画笔宽度

-(void)preStep;     // 上一步动作
-(void)clearAllStep;// 清空全部动作


@end
