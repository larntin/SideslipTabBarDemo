//
//  LeftView.h
//  SideslipTabBar
//
//  Created by zhangqingfeng on 13-7-9.
//  Copyright (c) 2013年 zhangqingfeng. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LeftView;
@protocol LeftViewDelegate <NSObject>

- (void)LeftView:(LeftView *)view selectedIndex:(NSInteger)integer;

@end

@interface LeftView : UIView
<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)   id<LeftViewDelegate>delegate;
@property (nonatomic, strong) NSArray *viewConttrollers;

- (id)initWithArray:(NSArray *)array;

@end
