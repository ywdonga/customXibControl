# customXibControl

- 前言
做开发也有蛮长的时间了，记得刚入行的时候不管写什么都是纯代码，从来都不会用Xib拖一个控件，更别说什么storyboard了。后来发现身边的同事都在用XIB写界面，每次我费了半天写出来的界面他两个小时就搞完了，而且适配也很完美。慢慢的就开始试着使用XIB和storyboard了。
用了XIB和storyboard一段时间后，发现人是越来越懒了，哪怕一个非常简单的界面控件啥的都不愿意多写一句代码了，直接XIB。但是遇到一个很尴尬的问题，就是用XIB去自定义一个视图时，在另外一个XIB上用的时候，单单继承是完全没有用的，最后还得用代码去创建。为此很是苦恼。
后来参考了好多网上的资料搞定了。为了后学者节约时间，特发此文。

- 详细步骤如下
1.创建一个即成UIView的类 

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1760826-fb9e4f6e205bc025.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
2.创建一个同名的XIB文件

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1760826-64052a147e239d74.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
3.在XIB中自定义你的视图以及控件，将控件自定义成你想要的样子

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1760826-bad7c7999c96b90c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

4.设置XIB的File's Owner 的Class为你创建的那个类

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1760826-dec5e6cb6db123be.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
5.将xib中的View拖拽关联成你创建的那个类的成员变量取名view

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1760826-baf45e6062d2c7ac.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
6.在创建的类.m文件重写如下方法

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1760826-dff2907a6ba58a79.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


```
/**
 XIB创建会掉用
 */
- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        [self setUI];
    }
    return self;
}

/**
 代码创建会掉用
 */
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

/**
 初始化
 */
- (void)setUI{
    [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    [self addSubview:self.view];
}

/**
 自动适配大小
 */
- (void)drawRect:(CGRect)rect{
    self.view.frame = self.bounds;
}
```
7.使用
XIB直接拖拽一个View然后即成你自定义的类就好了

![Paste_Image.png](http://upload-images.jianshu.io/upload_images/1760826-77afec79b6e66260.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


代码创建
```
CustomXibView *view = [[CustomXibView alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
```
