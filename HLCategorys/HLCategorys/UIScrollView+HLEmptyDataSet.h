//
//  UIScrollView+HLEmptyDataSet.h
//  HLCategorys
//
//  Created by JJB_iOS on 2022/5/26.
//

#import <UIKit/UIKit.h>
#import <DZNEmptyDataSet/UIScrollView+EmptyDataSet.h>

typedef NS_ENUM(NSInteger, HLEmptyDataSetType) {
    HLEmptyDataSetTypeNoData,       ///< 没有数据
    HLEmptyDataSetTypeCustomError,  ///< 自定义错误
};

@interface UIScrollView (HLEmptyDataSet) <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>
@property (nonatomic, strong) UIImage *hl_noDataImage UI_APPEARANCE_SELECTOR;
@property (nonatomic, strong) UIImage *hl_customErrorImage UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy) NSString *hl_noDataText UI_APPEARANCE_SELECTOR;
@property (nonatomic, copy) NSString *hl_customErrorText UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) HLEmptyDataSetType hl_emptyDataSetType UI_APPEARANCE_SELECTOR;
@property (nonatomic, assign) CGFloat hl_verticalOffset UI_APPEARANCE_SELECTOR; ///< 内容垂直偏移量 defulte 0

/**
 *  没有网络或者没有数据显示界面的点击事件
 */
- (void)hl_emptyDataSetBlock:(void(^)(void))hl_emptyDataSetBlock;
@end
