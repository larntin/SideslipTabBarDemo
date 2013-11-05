//
//  ViewController.m
//  SideslipTabBar
//
//  Created by zhangqingfeng on 13-7-9.
//  Copyright (c) 2013年 zhangqingfeng. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "LeftView.h"

@interface ViewController ()
<LeftViewDelegate>

@property (nonatomic, strong) UIView *transitionView;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (UIView *view_ in self.view.subviews) {
        if ([view_ isKindOfClass:[UITabBar class]]) {
            [view_ removeFromSuperview];
        }
        else{
            self.transitionView=view_;
        }
    }
    self.transitionView.frame=CGRectMake(0, 0, 320, 480);
    
    //左划
    UISwipeGestureRecognizer *swipeLeftGesture_=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGesterClick:)];
    swipeLeftGesture_.direction=UISwipeGestureRecognizerDirectionLeft;//不设置默认为右
    [self.transitionView addGestureRecognizer:swipeLeftGesture_];
    swipeLeftGesture_=nil;

    //右划
    UISwipeGestureRecognizer *swipeRightGesture_=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeGesterClick:)];
    [self.transitionView addGestureRecognizer:swipeRightGesture_];
    swipeRightGesture_=nil;
    
    
    OneViewController *oneViewController_=[[OneViewController alloc] init];
    UINavigationController *oneNav_=[[UINavigationController alloc] initWithRootViewController:oneViewController_];
    oneViewController_=nil;
    
    TwoViewController *twoViewController_=[[TwoViewController alloc] init];
    UINavigationController *twoNav_=[[UINavigationController alloc] initWithRootViewController:twoViewController_];
    twoViewController_=nil;
    
    self.viewControllers=@[oneNav_, twoNav_];
    oneNav_=nil;
    twoNav_=nil;
    
    LeftView *leftView_=[[LeftView alloc] initWithArray:self.viewControllers];
    leftView_.delegate=self;
    [self.view insertSubview:leftView_ atIndex:0];
    leftView_=nil;
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(showAndHiddenLeftView)
                                                 name:@"showAndHiddenLeftView"
                                               object:nil];
    
}

- (void)swipeGesterClick:(UISwipeGestureRecognizer *)swipeGesture{
    float x=self.transitionView.frame.origin.x;

    if (swipeGesture.direction==UISwipeGestureRecognizerDirectionLeft && x>0) {
        x=0;
        [UIView beginAnimations:nil context:nil];
        self.transitionView.frame=CGRectMake(x, 0, 320, 480);
        [UIView commitAnimations];
    }
    else if (swipeGesture.direction==UISwipeGestureRecognizerDirectionRight && x==0) {
        x=260;
        [UIView beginAnimations:nil context:nil];
        self.transitionView.frame=CGRectMake(x, 0, 320, 480);
        [UIView commitAnimations];
    }
    
}
- (void)showAndHiddenLeftView{
    float x=self.transitionView.frame.origin.x;
    if (x>0) {
        x=0;
    }
    else{
        x=260;
    }
    
    [UIView beginAnimations:nil context:nil];
    self.transitionView.frame=CGRectMake(x, 0, 320, 480);
    [UIView commitAnimations];
}

-(void)LeftView:(LeftView *)view selectedIndex:(NSInteger)integer{
    self.selectedIndex=integer;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"showAndHiddenLeftView" object:nil];
}

@end
