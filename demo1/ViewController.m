//
//  ViewController.m
//  demo1
//
//  Created by Roki on 6/4/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@interface ViewController (){
    UILabel *_label;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加UIButton，用于跳转到SecondViewController
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 300, 44)];
    [btn setTitle:@"ToSecondViewController" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(toSecondViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //添加UILabel，用于显示SecondViewController传过来的值
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 300, 44)];
    _label.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_label];
    
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotification:) name:@"getValue" object:nil];
    
}
- (void)toSecondViewController {
    SecondViewController *second = [[SecondViewController alloc] init];
    [self presentViewController:second animated:YES completion:nil];
}

//实现注册通知方法，给label赋值
-(void)getNotification:(NSNotification*)notification{

    NSDictionary *dict = [notification userInfo];
    _label.text = [dict objectForKey:@"test"];
    
}
@end
