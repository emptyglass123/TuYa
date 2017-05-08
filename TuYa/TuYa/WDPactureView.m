//
//  WDPactureView.m
//  TuYa
//
//  Created by 朱辉 on 2017/4/21.
//  Copyright © 2017年 jxx. All rights reserved.
//

#import "WDPactureView.h"

@interface WDPactureView()

@property(nonatomic,strong) NSMutableArray *allPointsArray;
@end

@implementation WDPactureView
-(void)setPencleWidth:(CGFloat)pencleWidth
{
    if (pencleWidth == 0.0) {
        pencleWidth = 5.0;
    }
    _pencleWidth = pencleWidth;
    if (self.allPointsArray) {
        
        [self setNeedsDisplay];
        
    }
}
-(void)setPencleColor:(UIColor *)pencleColor
{
    _pencleColor = pencleColor;
    if (self.allPointsArray) {
        
    [self setNeedsDisplay];

    }

}
-(NSMutableArray *)allPointsArray
{
    if (!_allPointsArray) {
        
        _allPointsArray = [NSMutableArray array];
    }
    return _allPointsArray;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   
    UITouch *touch = [touches anyObject];
    CGPoint poi = [touch locationInView:touch.view];
    NSMutableArray *poiArr = [NSMutableArray array];
    [poiArr addObject:[NSValue valueWithCGPoint:poi]];
    
    [self.allPointsArray addObject:poiArr];
    
    [self setNeedsDisplay];

}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint poi  = [touch locationInView:touch.view];
    [[self.allPointsArray lastObject] addObject:[NSValue valueWithCGPoint:poi]];
    

    [self setNeedsDisplay];


}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self setNeedsDisplay];

}

-(void)drawRect:(CGRect)rect
{
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    if (self.allPointsArray.count>0) {
        
        for (int i=0; i<[self.allPointsArray count]; i++) {
            
            NSArray *subLinePointsArr = self.allPointsArray[i];
            
            CGContextBeginPath(context);
            CGPoint myStartPoint=[[subLinePointsArr objectAtIndex:0] CGPointValue];
            CGContextMoveToPoint(context, myStartPoint.x, myStartPoint.y);
            
            if ([subLinePointsArr count] > 1) {
                
                for (int j = 0; j < [subLinePointsArr count] - 1; j ++) {
                    CGPoint myEndPoint=[[subLinePointsArr objectAtIndex:j] CGPointValue];
                    CGContextAddLineToPoint(context, myEndPoint.x,myEndPoint.y);
                }
            }else {
                CGContextAddLineToPoint(context, myStartPoint.x,myStartPoint.y);
            }
            CGContextSetStrokeColorWithColor(context, _pencleColor.CGColor);
            CGContextSetLineWidth(context, _pencleWidth);
            CGContextStrokePath(context);
        }
    }
}
-(void)preStep
{
    [self.allPointsArray removeLastObject];
    [self setNeedsDisplay];
}
-(void)clearAllStep
{
    [self.allPointsArray removeAllObjects];
    [self setNeedsDisplay];

}
@end
