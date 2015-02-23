#CorePullScale
####表格顶部图片下拉放大控件，`一键式安装`，异常简单


<br />
##框架特性：<br />
>1.支持所有ios版本（ios6-ios8），没有版本压力！<br />
>2.支持大屏的横竖屏，不再担心横屏变形了。<br />
>2.支持TableView 及 CollectionView 。<br />

<br />
##安装说明：<br />
>1.将CorePullScale文件夹放入您的项目中<br />
>2.#import "UIScrollView+PullScale.h"<br />
>3.在ViewdidLoad中直接按以下代码安装即可（图片名换成您对应的图片名）<br />

    [self.tableView addPullScaleFuncWithImgName:@"car@2x.jpg" originalHeight:150 hasNavBar:(self.navigationController!=nil)];
  
>4.如果需要支持iPhone6 Plus，请复制以下方法到您的控制器<br />

    -(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
        [self.tableView rotationSupportWithNavBarH:self.navigationController.navigationBar.bounds.size.height];
    }

<br />
##看看效果图吧
![image](./img/1.png)


<br /><br />
#### 版权说明 RIGHTS ：<br />
本框架由iOS开发攻城狮Charlin制作<br /><br />
#### 作者简介 INTRODUCE ：<br />
Charlin-四川成都华西都市报旗下华西都市网络有限公司技术部iOS工程师！
<br /><br />
#### 联系方式 CONTACT ：<br />
Q    Q：1761904945（请注明缘由）<br />
Mail：1761904945@qq.com
<br />

