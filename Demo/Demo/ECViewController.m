//
//  EAViewController.m
//  Demo
//
//  Created by SU BO-YU on 2013/10/28.
//  Copyright (c) 2013年 SU BO-YU. All rights reserved.
//

#import "ECViewController.h"
#import "ECPieChartViewData.h"

@interface ECViewController ()
@property (strong, nonatomic) NSArray *pieChartViewDatas;
@end

@implementation ECViewController

- (void)initPieChartViewDatas
{
    ECPieChartViewData *dataA = [ECPieChartViewData pieChartViewDataWithTitle:@"A" count:100.0 color:[UIColor redColor]];
    ECPieChartViewData *dataB = [ECPieChartViewData pieChartViewDataWithTitle:@"B" count:100.0 color:[UIColor greenColor]];
    ECPieChartViewData *dataC = [ECPieChartViewData pieChartViewDataWithTitle:@"C" count:200.0 color:[UIColor blueColor]];
    self.pieChartViewDatas = [NSArray arrayWithObjects:dataA, dataB, dataC, nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initPieChartViewDatas];
    
    self.pieChartView.dataSource = self;
    self.pieChartView.delegate = self;
    
    [self.pieChartView drawChartView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ECPieChartViewDataSource
- (NSInteger)numberOfGroupsInPieChartView:(ECPieChartView *)pieChartView
{
    return self.pieChartViewDatas.count;
}

- (NSInteger)totalCountInPieChartView:(ECPieChartView *)pieChartView
{
    NSUInteger totalCount = 0;
    for (ECPieChartViewData *data in self.pieChartViewDatas)
    {
        totalCount += data.count;
    }
    
    return totalCount;
}

#pragma mark - ECPieChartViewDelegate
- (UIColor *)pieChartView:(ECPieChartView *)pieChartView colorForIndex:(NSInteger)index
{
    ECPieChartViewData *data = [self.pieChartViewDatas objectAtIndex:index];
    
    return data.color;
}

- (NSUInteger)pieChartView:(ECPieChartView *)pieChartView countForIndex:(NSInteger)index
{
    ECPieChartViewData *data = [self.pieChartViewDatas objectAtIndex:index];
    
    return data.count;
}

- (NSString *)pieChartView:(ECPieChartView *)pieChartView titleForIndex:(NSInteger)index;
{
    ECPieChartViewData *data = [self.pieChartViewDatas objectAtIndex:index];
    
    return data.title;
}

- (UIFont *)pieChartView:(ECPieChartView *)pieChartView fontForIndex:(NSInteger)index
{
    return [UIFont fontWithName:@"ArialRoundedMTBold" size:16];
}
@end
