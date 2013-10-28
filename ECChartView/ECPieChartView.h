//
//  EAPieChartView.h
//  EAChartView
//
//  Created by SU BO-YU on 2013/10/27.
//  Copyright (c) 2013年 SU BO-YU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECPieChartViewData.h"

@protocol ECPieChartViewDataSource;
@protocol ECPieChartViewDelegate;

@interface ECPieChartView : UIView
@property (weak, nonatomic) id<ECPieChartViewDataSource> dataSource;
@property (weak, nonatomic) id<ECPieChartViewDelegate> delegate;

- (void)drawChartView;
@end

@protocol ECPieChartViewDataSource <NSObject>
@required
- (NSInteger)numberOfGroupsInPieChartView:(ECPieChartView *)pieChartView;
- (NSInteger)totalCountInPieChartView:(ECPieChartView *)pieChartView;

@optional

@end

@protocol ECPieChartViewDelegate <NSObject>
@required
- (UIColor *)pieChartView:(ECPieChartView *)pieChartView colorForIndex:(NSInteger)index;
- (NSUInteger)pieChartView:(ECPieChartView *)pieChartView countForIndex:(NSInteger)index;
- (NSString *)pieChartView:(ECPieChartView *)pieChartView titleForIndex:(NSInteger)index;
@optional
- (UIFont *)pieChartView:(ECPieChartView *)pieChartView fontForIndex:(NSInteger)index;
@end
