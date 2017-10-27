//
//  ViewController.m
//  BarLine
//
//  Created by Vito on 2017/8/27.
//  Copyright © 2017年 metarnet. All rights reserved.
//

#import "ViewController.h"
#import "MCBarChartView.h"

@interface ViewController ()<MCBarChartViewDataSource,MCBarChartViewDelegate>
{
    MCBarChartView *_barChartView2;
    NSArray * _title;
    NSArray * _values;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _barChartView2 = [[MCBarChartView alloc] initWithFrame:CGRectMake(0, 170, self.view.frame.size.width - 15 , self.view.frame.size.height - 280)];
    _barChartView2.backgroundColor = [UIColor grayColor];
    _barChartView2.dataSource = self;
    _barChartView2.delegate = self;
    
    _barChartView2.unitOfYAxis = @"";
    _barChartView2.numberOfYAxis = 10;
    _barChartView2.colorOfXAxis = [UIColor grayColor];
    _barChartView2.colorOfXText = [UIColor blackColor];
    _barChartView2.colorOfYAxis = [UIColor grayColor];
    _barChartView2.colorOfYText = [UIColor redColor];
    [self.view addSubview:_barChartView2];
    
    NSMutableArray * titles = [NSMutableArray array];
    NSMutableArray * values = [NSMutableArray array];
    for(int i = 0; i < 10; i++){
        [titles addObject:[NSString stringWithFormat:@"标题%d",i]];
        [values addObject:[NSNumber numberWithInt:arc4random() % 100 + 10]];
    }
    _title = [titles copy];
    _values = [values copy];
    _barChartView2.mixValue = @0;
    _barChartView2.maxValue = @110;
    [_barChartView2 reloadDataWithAnimate:YES];
}


- (NSInteger)numberOfSectionsInBarChartView:(MCBarChartView *)barChartView {
    
    return 2;
    
}

- (NSInteger)barChartView:(MCBarChartView *)barChartView numberOfBarsInSection:(NSInteger)section {
    
    return _values.count;
    
}

- (id)barChartView:(MCBarChartView *)barChartView valueOfBarInSection:(NSInteger)section index:(NSInteger)index {
    
    return _values[index];
    
}

- (UIColor *)barChartView:(MCBarChartView *)barChartView colorOfBarInSection:(NSInteger)section index:(NSInteger)index {
    
    //    if (index == 0) {
    //        return [UIColor colorWithRed:37/255.0 green:177/255.0 blue:179/255.0 alpha:1.0];
    //    }else if (index == 1){
    //        return [UIColor colorWithRed:252/255.0 green:160/255.0 blue:74/255.0 alpha:1];
    //    }
    return  [UIColor colorWithRed:252/255.0 green:160/255.0 blue:74/255.0 alpha:1];;
    
}

- (CGFloat)paddingForBarInBarChartView:(MCBarChartView *)barChartView{
    return 50;
}

- (CGFloat)barWidthInBarChartView:(MCBarChartView *)barChartView{
    return 30;
}


- (NSString *)barChartView:(MCBarChartView *)barChartView titleOfBarInSection:(NSInteger)section {
    
    return _title[section];
}

- (NSString *)barChartView:(MCBarChartView *)barChartView informationOfBarInSection:(NSInteger)index{
    return _title[index];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
