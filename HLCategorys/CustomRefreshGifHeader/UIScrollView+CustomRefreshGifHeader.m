//
//  UIScrollView+CoustomRefreshGifHeader.m
//  HLCategorys
//
//  Created by JJB_iOS on 2022/6/24.
//

#import "UIScrollView+CustomRefreshGifHeader.h"
#import "CustomRefreshGifHeader.h"

@implementation UIScrollView (CustomRefreshGifHeader)

#pragma mark - Rewrite Method

- (void)hl_setGifRefreshWithHeaderBlock:(void(^)(void))headerBlock
                            footerBlock:(void(^)(void))footerBlock
{
    CustomRefreshGifHeader *header = [CustomRefreshGifHeader headerWithRefreshingBlock:^{
        if (headerBlock) {
            headerBlock();
        }
    }];
    
    [self hl_setRefreshWithRefreshHeader:header
                             footerBlock:footerBlock];
}

@end
