//
//  SecondViewController.m
//  demo1
//
//  Created by Roki on 6/7/15.
//  Copyright (c) 2015 Roki. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController (){
    UITextField *_textField;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //添加一个按钮用于返回ViewController
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 300, 44)];
    [btn setTitle:@"BackToViewController" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(postNotification) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //添加一个UITextField
    _textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, 300, 44)];
    _textField.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_textField];
}
#pragma  mark -Action
- (void)postNotification {

    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:_textField.text,@"test" ,nil];
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"getValue" object:nil userInfo:dict];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    [self dismissViewControllerAnimated:YES completion:nil];

}


@end
