//
//  ViewController.m
//  JKPopverView
//
//  Created by Jakin on 2017/8/10.
//  Copyright © 2017年 Jakin. All rights reserved.
//

#import "ViewController.h"
#import "JKPopverView.h"

@interface ViewController ()

@property (nonatomic, strong) JKPopverView *jkPopverView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 30, 70, 60);
    [button setTitle:@"小气泡" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:button];
     _jkPopverView = [JKPopverView showText:@"小气泡" inView:self.view relateView:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
