# HLCategorys
对MJRefresh、DZNEmptyDataSet封装

##### 支持使用CocoaPods引入, Podfile文件中添加:

``` objc
pod 'HLCategorys', '1.0.4'
```

如果想全局替换HLCategorys的图片资源，可以在工程中新建一个名字为`HLCategorys.bundle`的bundle，参照pod中`HLCategorys.bundle`为图片资源命名。HLCategorys会优先加载当前工程中的图片资源。
# Demonstration
![image](https://github.com/huangchangweng/HLCategorys/blob/main/QQ20220610-135255.gif)

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

# GlobalSetting

如果您项目中多个地方使用到该组件，您可以全局设置样式，例在`AppDelegate`添加

``` objc
// 全局设置UIScrollView+HLEmptyDataSet样式
[UIScrollView appearance].hl_noDataText = @"没有数据";
// 全局设置UIScrollView+HLRefresh样式
[UIScrollView appearance].hl_noMoreDataText= @"没有更多数据";
```

> 注意：`代码` > `appearance` > `interface builder`，所以appearance设置的会覆盖在xib或storyboard中设置的属性，当然`代码`会覆盖`appearance`设置

>  如果你想自定义下拉刷新gif，你可以参照HLCategorys demo中`CustomRefreshGifHeader`文件的设置

# Requirements

iOS 9.0 +, Xcode 7.0 +
# Dependency

- "MJRefresh", "3.7.5"
- "DZNEmptyDataSet", "1.8.1"

# Version

* 1.0.4 :

  UIScrollView+HLEmptyDataSet底部添加按钮功能
  
* 1.0.3 :

  UIScrollView+HLEmptyDataSet使用崩溃问题
  
* 1.0.2 :

  添加全局设置样式功能
  
* 1.0.1 :

  修改图片资源加载问题
  
* 1.0.0 :

  完成HLCategorys基础搭建

# License
HLCategorys is available under the MIT license. See the LICENSE file for more info.
