//
//  NextViewController.m
//  SideslipTabBar
//
//  Created by zhangqingfeng on 13-7-9.
//  Copyright (c) 2013年 zhangqingfeng. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor=[UIColor whiteColor];
    
    UIImageView *imageView_=[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height-45)];
    imageView_.contentMode=UIViewContentModeScaleAspectFit;
    imageView_.image=[UIImage imageNamed:@"2.jpg"];
    [self.view addSubview:imageView_];
    imageView_=nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
