//
//  WDDrawPictureModel.h
//  TuYa
//
//  Created by 朱辉 on 2017/4/21.
//  Copyright © 2017年 jxx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDDrawPictureModel : NSObject

@property (nonatomic, assign) NSInteger pencleWith ;// 画笔宽度
@property (nonatomic, strong) UIColor  *pencleColor;// 画笔颜色
@property (nonatomic, assign) CGFloat color_R ;
@property (nonatomic, assign) CGFloat color_G ;
@property (nonatomic, assign) CGFloat color_B ;



@end
