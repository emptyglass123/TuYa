//
//  UILabel+creat.m
//  GMS
//
//  Created by 朱辉 on 16/11/2.
//  Copyright © 2016年 张祚彬. All rights reserved.
//

#import "UILabel+creat.h"

@implementation UILabel (creat)

+(UILabel *)creatNormalLableWithText:(NSString *)text frame:(CGRect)rect
{
    
    UILabel *lable = [[UILabel alloc] initWithFrame:rect];
    lable.text = text;
    lable.font = [UIFont systemFontOfSize:12];
    lable.textColor = RGB(50, 50, 50);
    
    return lable;
}

@end
