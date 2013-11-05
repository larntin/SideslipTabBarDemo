//
//  TwoViewController.m
//  SideslipTabBar
//
//  Created by zhangqingfeng on 13-7-9.
//  Copyright (c) 2013年 zhangqingfeng. All rights reserved.
//

#import "TwoViewController.h"
#import "NextViewController.h"

@interface TwoViewController ()
<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *myArray;

@end

@implementation TwoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"TwoViewController";
        self.tabBarItem.image=[UIImage imageNamed:@"1.gif"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.backgroundColor=[UIColor whiteColor];
    
    UIBarButtonItem *rightBarButton_=[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sideslipBarImage.png"]
                                                                     style:UIBarButtonItemStyleBordered
                                                                    target:self
                                                                    action:@selector(rightBarButtonClick)];
    self.navigationItem.leftBarButtonItem=rightBarButton_;
    rightBarButton_=nil;
    
    
    self.myArray=@[@"张三",@"李四",@"王二",@"王二麻子"];
    
    UITableView *tableView_=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 430)];
    tableView_.backgroundColor=[UIColor clearColor];
    tableView_.rowHeight=50;
    tableView_.delegate=self;
    tableView_.dataSource=self;
    [self.view addSubview:tableView_];
    tableView_=nil;

}

- (void)rightBarButtonClick{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"showAndHiddenLeftView" object:nil];
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellString_=@"tableCell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellString_];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellString_];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }    
    cell.textLabel.text=self.myArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NextViewController *nextViewController_=[[NextViewController alloc] init];
    [self.navigationController pushViewController:nextViewController_ animated:YES];
    nextViewController_=nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
