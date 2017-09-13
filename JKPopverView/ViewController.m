//
//  ViewController.m
//  JKPopverView
//
//  Created by Miao on 2017/7/28.
//  Copyright © 2017年 Miao. All rights reserved.
//

#import "ViewController.h"
#import "JKPopverView.h"

@interface ViewController ()

@property (nonatomic, strong) JKPopverView *jkPopverView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    JKPopverView *jkPopverView = [JKPopverView showText:@"tips浮动显示哈" inView:self.view relateView:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
