//
//  EAPieChartViewData.h
//  EAChartView
//
//  Created by SU BO-YU on 2013/10/27.
//  Copyright (c) 2013年 SU BO-YU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ECPieChartViewData : NSObject
@property (strong, nonatomic) NSString *title;
@property (nonatomic) NSUInteger count;
@property (strong, nonatomic) UIColor *color;

+ (id)pieChartViewDataWithTitle:(NSString *)title count:(NSUInteger)count color:(UIColor *)color;

- (id)initWithTitle:(NSString *)title count:(NSUInteger)count color:(UIColor *)color;
@end
