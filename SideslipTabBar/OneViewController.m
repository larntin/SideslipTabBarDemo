//
//  OneViewController.m
//  SideslipTabBar
//
//  Created by zhangqingfeng on 13-7-9.
//  Copyright (c) 2013年 zhangqingfeng. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()

@end

@implementation OneViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"OneViewController";
        self.tabBarItem.image=[UIImage imageNamed:@"0.gif"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   	self.view.backgroundColor=[UIColor whiteColor];
    
    UIBarButtonItem *leftBarButton_=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sideslipBarImage.png"]
                                                                     style:UIBarButtonItemStyleBordered
                                                                    target:self
                                                                    action:@selector(leftBarButtonItemClick)];
    self.navigationItem.leftBarButtonItem=leftBarButton_;
    leftBarButton_=nil;
    
    UITextView *textView_=[[UITextView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height-45)];
    textView_.font=[UIFont systemFontOfSize:20];
    textView_.editable=NO;
    textView_.dataDetectorTypes=UIDataDetectorTypeLink;
    textView_.text=@"      欢迎使用本demo，本demo是基于UITabBarController实现的，通过最简单的方法实现侧滑的标签栏,左边的标签栏可高度自定义，希望对您有所帮助。\n\n更多精彩内容请关注: http://blog.sina.com.cn/u/2526279194 \n\n欢迎留言";
    [self.view addSubview:textView_];
    textView_=nil;
}

- (void)leftBarButtonItemClick{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showAndHiddenLeftView" object:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
