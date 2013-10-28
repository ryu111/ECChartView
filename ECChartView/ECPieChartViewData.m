//
//  EAPieChartViewData.m
//  EAChartView
//
//  Created by SU BO-YU on 2013/10/27.
//  Copyright (c) 2013年 SU BO-YU. All rights reserved.
//

#import "ECPieChartViewData.h"

@implementation ECPieChartViewData
@synthesize title = _title;
@synthesize count = _count;
@synthesize color = _color;

+ (id)pieChartViewDataWithTitle:(NSString *)title count:(NSUInteger)count color:(UIColor *)color
{
    return [[ECPieChartViewData alloc] initWithTitle:title count:count color:color];
}

- (id)initWithTitle:(NSString *)title count:(NSUInteger)count color:(UIColor *)color
{
    if (self = [super init])
    {
        self.title = title;
        self.count = count;
        self.color = color;
    }
    
    return self;
}
@end
