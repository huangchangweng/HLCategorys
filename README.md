# HLCategorys
对MJRefresh、DZNEmptyDataSet封装

##### 支持使用CocoaPods引入, Podfile文件中添加:

``` objc
pod 'HLCategorys', '1.0.0'
```
HLHUD中全是类方法，导入即用。

基本使用方法:<p>

- UIScrollView+HLEmptyDataSet 基本用法
``` objc
// 1.设置空数据占位点击回调，只用调用了此方法才会用空数据占位视图
[self.tableView hl_emptyDataSetBlock:^{
  STRONG_SELF
  [strongSelf.tableView hl_headerBeginRefreshing];
}];
// 2.在获取数据为空的时候设置
self.tableView.hl_emptyDataSetType = HLEmptyDataSetTypeNoData;
```
  
- UIScrollView+HLRefresh 基本用法
``` objc
  WEAK_SELF
  // 1.设置上拉和下拉
    // [self.tableView hl_setRefreshWithHeaderBlock:^{ // 菊花样式
    [self.tableView hl_setGifRefreshWithHeaderBlock:^{ // git样式
        STRONG_SELF
        strongSelf.page = 0;
        [strongSelf requestData];
    } footerBlock:^{
        STRONG_SELF
        strongSelf.page ++;
        [strongSelf requestData];
    }];
  // 2.在数据获取后，判断数据长度，例：
  if (self.dataArray.count == 0) {
            // self.tableView.hl_emptyDataSetType = HLEmptyDataSetTypeNoData;
            [self.tableView hl_footerNoData];
        } else {
            [self.tableView hl_footerEndRefreshing];
        }
        [self.tableView reloadData];
        [self.tableView hl_headerEndRefreshing];
```
  
- UIView+HLCategory 基本用法
``` objc
@property (nonatomic, assign) CGFloat hl_x;
@property (nonatomic, assign) CGFloat hl_y;
@property (nonatomic, assign) CGFloat hl_maxX;
@property (nonatomic, assign) CGFloat hl_maxY;
@property (nonatomic, assign) CGFloat hl_width;
@property (nonatomic, assign) CGFloat hl_height;
@property (nonatomic, assign) CGFloat hl_centerX;
@property (nonatomic, assign) CGFloat hl_centerY;
@property (nonatomic, assign) CGFloat hl_top;
@property (nonatomic, assign) CGFloat hl_left;
@property (nonatomic, assign) CGFloat hl_bottom;
@property (nonatomic, assign) CGFloat hl_right;
@property (nonatomic, assign) CGSize hl_size;
@property (nonatomic, assign) CGPoint hl_origin;

#pragma mark - Method

/**
 *  获取viewController
 */
- (UIViewController *)hl_viewController;

/**
 *  添加圆角
 *  corners 圆角位置
 *  cornerRadii 圆角大小
 */
- (void)hl_addBezierCorners:(UIRectCorner)corners
                cornerRadii:(CGSize)cornerRadii;

/**
 *  绘制虚线
 *  lineLength  虚线的宽度
 *  lineSpacing 虚线的间距
 *  lineColor:  虚线的颜色
 **/
- (void)hl_drawDashLine:(int)lineLength
            lineSpacing:(int)lineSpacing
              lineColor:(UIColor *)lineColor;
```

# Requirements

iOS 9.0 +, Xcode 7.0 +

# Version

* 1.0.0 :

  完成HLCategorys基础搭建

# License
HLNetworkManager is available under the MIT license. See the LICENSE file for more info.
