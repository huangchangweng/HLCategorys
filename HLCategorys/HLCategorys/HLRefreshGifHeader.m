//
//  HLRefreshGifHeader.m
//  HLCategorys
//
//  Created by JJB_iOS on 2022/5/27.
//

#import "HLRefreshGifHeader.h"

@implementation HLRefreshGifHeader

#pragma mark - Private Method

+ (UIImage *)budleImageWithName:(NSString *)imageName
{
    NSString *bundleName = @"HLCategorys";
    // 静态库 url 的获取
    NSURL *url = [[NSBundle mainBundle] URLForResource:bundleName withExtension:@"bundle"];
    if (!url) {
        // 动态库 url 的获取
        url = [[NSBundle bundleForClass:[self class]] URLForResource:bundleName withExtension:@"bundle"];
    }
    NSBundle *bundle = [NSBundle bundleWithURL:url];
    UIImage *image = [UIImage imageNamed:imageName inBundle:bundle compatibleWithTraitCollection:nil];
    return image;
}

#pragma mark - Rewrite Method

- (void)prepare
{
    [super prepare];

    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=3; i++) {
        UIImage *image = [HLRefreshGifHeader budleImageWithName:[NSString stringWithFormat:@"loading_%zd", i]];
        [refreshingImages addObject:image];
    }
    // 设置普通状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateIdle];
    // 设置松开就可以进行刷新的状态图片
//    [self setImages:refreshingImages forState:MJRefreshStatePulling];
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];
}

@end
