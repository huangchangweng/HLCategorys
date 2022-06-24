//
//  AppDelegate.m
//  HLCategorys
//
//  Created by JJB_iOS on 2022/5/26.
//

#import "AppDelegate.h"
#import "UIScrollView+HLEmptyDataSet.h"
#import "UIScrollView+HLRefresh.h"
#import "HLRefreshGifHeader.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 全局设置UIScrollView+HLEmptyDataSet样式
    [UIScrollView appearance].hl_noDataText = @"没有数据";
    // 全局设置UIScrollView+HLRefresh样式
    [UIScrollView appearance].hl_noMoreDataText= @"没有更多数据";
    
    return YES;
}

@end
