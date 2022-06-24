//
//  UIScrollView+CoustomRefreshGifHeader.h
//  HLCategorys
//
//  Created by JJB_iOS on 2022/6/24.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+HLRefresh.h"

@interface UIScrollView (CustomRefreshGifHeader)

#pragma mark - Rewrite Method

- (void)hl_setGifRefreshWithHeaderBlock:(void(^)(void))headerBlock
                            footerBlock:(void(^)(void))footerBlock;

@end
