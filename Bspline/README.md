本程序实现了 均匀B样条曲线、准均匀B样条曲线以及分段Bezier的绘制。

本程序为参考[MATLAB绘制B样条曲线_NobodyZhou-CSDN博客](https://blog.csdn.net/mr_grit/article/details/45603627)进行修改注释学习，仅供笔者及同学参考，侵权删。

参考资料：

B样条法内容不多，但是设计程序时细节很影响最后的实验结果，而网络上许多讲解都有着或多或少的错误。以下提供的参考资料，笔者仅提供笔者发现的错误，建议读者仔细检查。

[深入理解B样条曲线（上） ](https://zhuanlan.zhihu.com/p/144042470)

本文详细地介绍了均匀周期性 B 样条曲线的生成过程。

错误：文章最后说道：“然后将 t 从 0 取至 6，获得的点集就是我们想要的均匀周期性 B 样条曲线。”，t的取值区间出错，必须是所有基函数都不为0的支撑区间。同时计算多项式递推公式出错。正确公式如下。

![正确基函数](https://img-blog.csdn.net/20180328202647357)

[计算机图形学 学习笔记（十一）：曲线曲面（三）：B样条 曲线与曲面_学愈进而愈惘-CSDN博客](https://blog.csdn.net/jurbo/article/details/75125663)

本文对应的课程[计算机图形学bezier曲线曲面B样条曲线曲面_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1Dt411f7Qj?p=23)讲解出错，首先是递推公式出错，正确公式如上。其次是如下的**B样条曲线的数字表达式**第一行的的后面的方括号应该为圆括号),不能包括此值。

![这里写图片描述](https://img-blog.csdn.net/20170714163343497?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvSnVyYm8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

学习时也要注意B样条曲线的凸包性。

![凸包性](https://img-blog.csdn.net/20170714164859351?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvSnVyYm8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)