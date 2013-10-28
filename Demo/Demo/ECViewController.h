//
//  EAViewController.h
//  Demo
//
//  Created by SU BO-YU on 2013/10/28.
//  Copyright (c) 2013年 SU BO-YU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECPieChartView.h"

@interface ECViewController : UIViewController <ECPieChartViewDataSource, ECPieChartViewDelegate>
@property (weak, nonatomic) IBOutlet ECPieChartView *pieChartView;

@end
