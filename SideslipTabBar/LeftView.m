//
//  LeftView.m
//  SideslipTabBar
//
//  Created by zhangqingfeng on 13-7-9.
//  Copyright (c) 2013年 zhangqingfeng. All rights reserved.
//

#import "LeftView.h"
#import <QuartzCore/QuartzCore.h>

@implementation LeftView

- (id)initWithArray:(NSArray *)array
{
    self = [super initWithFrame:CGRectMake(0, 0, 320, 480)];
    if (self) {
        self.backgroundColor=[UIColor colorWithRed:239.0/255 green:250.0/255 blue:233.0/255 alpha:1];
        self.viewConttrollers=array;
        
        UILabel *titleLabel_=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 260, 44)];
        titleLabel_.backgroundColor=[UIColor scrollViewTexturedBackgroundColor];
        titleLabel_.layer.shadowColor=[UIColor blackColor].CGColor;
        titleLabel_.layer.shadowOffset=CGSizeMake(-2, -5);
        titleLabel_.layer.shadowOpacity=0.5;
        titleLabel_.text=@"此处可放置logo和一些按扭";
        titleLabel_.font=[UIFont boldSystemFontOfSize:20];
//        titleLabel_.textAlignment=NSTextAlignmentCenter;
        titleLabel_.textColor=[UIColor whiteColor];
        [self addSubview:titleLabel_];
        
        UITableView *tableView_=[[UITableView alloc] initWithFrame:CGRectMake(0, 50, 260, 435)];
        tableView_.backgroundColor=[UIColor clearColor];
        tableView_.separatorStyle=UITableViewCellSeparatorStyleNone;
        tableView_.rowHeight=50;
        tableView_.delegate=self;
        tableView_.dataSource=self;
        [self addSubview:tableView_];
        
        NSIndexPath *indexPath_=[NSIndexPath indexPathForRow:0 inSection:0];
        
        [tableView_ selectRowAtIndexPath:indexPath_ animated:YES scrollPosition:UITableViewScrollPositionNone];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.viewConttrollers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellString_=@"tableCell";
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellString_];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellString_];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    UIViewController *viewController_=self.viewConttrollers[indexPath.row];
    
    cell.imageView.image=viewController_.tabBarItem.image;
    cell.textLabel.text=viewController_.tabBarItem.title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(LeftView:selectedIndex:)]) {
        [self.delegate LeftView:self selectedIndex:indexPath.row];
    }
}

- (void)btnClick{
    NSLog(@"left");
}

@end
