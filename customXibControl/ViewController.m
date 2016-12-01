//
//  ViewController.m
//  customXibControl
//
//  Created by dyw on 16/12/1.
//  Copyright © 2016年 dyw. All rights reserved.
//

#import "ViewController.h"
#import "CustomXibView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    CustomXibView *view = [[CustomXibView alloc] initWithFrame:CGRectMake(0, 20, 300, 240)];
    
    [self.view addSubview:view];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
