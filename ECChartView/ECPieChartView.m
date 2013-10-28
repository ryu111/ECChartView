//
//  EAPieChartView.m
//  EAChartView
//
//  Created by SU BO-YU on 2013/10/27.
//  Copyright (c) 2013年 SU BO-YU. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ECPieChartView.h"

@implementation ECPieChartView
@synthesize dataSource = _dataSource;
@synthesize delegate = _delegate;

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGFloat width = CGRectGetWidth(rect);
    CGFloat height = CGRectGetHeight(rect);
    CGFloat minValue = MIN(width, height);
    double lineWidth = ceil((double)minValue / 100.0f);
    CGContextSetRGBStrokeColor(context, 0, 0, 0, 1);
    CGContextSetLineWidth(context, lineWidth);
    
    CGFloat radius = minValue / 2 - lineWidth;
    CGPoint point = CGPointMake(width / 2, height / 2);
    
    CGFloat currentAngle = 0;
    NSUInteger totalCount = [self.dataSource totalCountInPieChartView:self];
    NSUInteger groupNumber = [self.dataSource numberOfGroupsInPieChartView:self];
    for (int index = 0; index < groupNumber; index++)
    {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(point.x, point.y, 100, 20)];
        NSString *title = [self.delegate pieChartView:self titleForIndex:index];
        label.backgroundColor = [UIColor clearColor];
        label.text = title;
        [self addSubview:label];
        if ([self.delegate respondsToSelector:@selector(pieChartView:fontForIndex:)])
        {
            label.font = [self.delegate pieChartView:self fontForIndex:index];
        }
        
        UIColor *color = [self.delegate pieChartView:self colorForIndex:index];
        CGFloat count = [self.delegate pieChartView:self countForIndex:index];
        
        CGFloat percent = (float)count / (float)totalCount;
        CGFloat angle = (360 * percent) * (M_PI / 180) + currentAngle;
        
        CGFloat r, g, b, a;
        [color getRed:&r green:&g blue:&b alpha:&a];
        
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetRGBFillColor(context, r, g, b, a);
        CGContextMoveToPoint(context, point.x, point.y);
        CGContextAddArc(context, point.x, point.y, radius, currentAngle, angle, 0);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathEOFillStroke);
        
        currentAngle = angle;
    }
}

- (void)drawChartView
{
    if (self.dataSource && self.delegate)
    {
        [self setNeedsDisplay];
    }
}

@end
