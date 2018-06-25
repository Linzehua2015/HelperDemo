# HelperDemo
使用Helper.h负责管理表单的内容。
在iOS开发过程中，经常遇到同一个界面有多个表单的情况，表单通常为UITableView/UICollectionView，其数据展示方式是通过实现代理方法，返回布局、样式最终展示到界面上。
在多表单的情况下，如果将实现代理方法都设置为同一个对象，会导致这个对象的实现文件代码量变得庞大，可读性低。先看下如下例子。

 ![需求](https://upload-images.jianshu.io/upload_images/2083012-f28fd3eb65812ee6.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
 
相信很多读者看到这里，会想到将上图的三个表单通过实现三个不同的View将其分开，然后在ViewController里将3个包含表单的View贴上去。
我的处理方法大致上也类似，但我并不去创建一个新的View来容纳CollectionView。
思路如下：

![我的解决方案](https://upload-images.jianshu.io/upload_images/2083012-e730dda14760d051.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/640) 

我通过创建三个不同的“Helper”来负责实现以上三个不同的表单，即将以上3个表单的数据代理方法给Helper来实现。
``` 
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UICollectionView *headerCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *contentCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *footerCollectionView;

@property (nonatomic, strong) HeaderHelper *headerHelper;
@property (nonatomic, strong) ContentHelper *contentHelper;
@property (nonatomic, strong) FooterHelper *footerHelper;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // HeaderHelper负责实现顶部表单
    self.headerHelper = [HeaderHelper new];
    self.headerCollectionView.dataSource = self.headerHelper;
    self.headerCollectionView.delegate = self.headerHelper;
    
    // ContentHelper负责中间的内容表单
    self.contentHelper = [ContentHelper new];
    self.contentCollectionView.dataSource = self.contentHelper;
    self.contentCollectionView.delegate = self.contentHelper;
    
    // FooterHelper负责底部功能选项的表单
    self.footerHelper = [FooterHelper new];
    self.footerCollectionView.dataSource = self.footerHelper;
    self.footerCollectionView.delegate = self.footerHelper;
} 

@end
```
---
## 其他应用场景
咱们继续往下，这套解决方案同样可以用在应用内的搜索模块。
如下：
![搜索模块](https://upload-images.jianshu.io/upload_images/2083012-a5885b5d9ae7e4f8.jpg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
在一个ViewController下实现3个不同的Helper，在用户进行搜索操作的时候，根据返回的数据是否为空，切换表单的代理方法实现对象，以此达到不数据内容变化。
