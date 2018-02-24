# muc_mvp   这是一个测试版  主要为了加入DataBinding模块 并 进一步优化代码
我的MVP一键模板终于完成了  后期将考虑加入DataBind框架...
![image](https://github.com/goodluckforme/muc_mvp/blob/master/icon_MVP%E4%BD%BF%E7%94%A8%E7%A4%BA%E4%BE%8B.gif) 
![image](https://github.com/goodluckforme/muc_mvp/blob/master/icon_Template%E7%9B%AE%E5%BD%95%E7%BB%93%E6%9E%84.png) 
![image](https://github.com/goodluckforme/muc_mvp/blob/master/icon_activitys%E4%B8%8B%E6%A8%A1%E6%9D%BF.png) 
![image](https://github.com/goodluckforme/muc_mvp/blob/master/icon_%E6%A8%A1%E6%9D%BF%E6%A0%B9%E7%9B%AE%E5%BD%95.png) 



第二版优化正在优化中·········
1 module gradle 中加入 databind

2 module 路径修改

3 修改recipe

4 动态加入 ActivityMainComponent 以前是单一的ActivityComponent

5 加入module DataBindingModule

6 修改 BaseActivity

7 修改Presenter   只有 Activity部分  这里只能生成一个Presenter 不分离
 
8 修改布局 

9 修改Activity 

10 多个Activity场景完成

11 修改Fragment部分

第二版优化持续优化中·········

###=============================此处为解决DataBinding与Dagger2的在Kapt的情况下编译不通过问题的解决方案======================================
***********只完成了  Activity部分  并且  DataBind 只允许使用java生成代码
尝试解决上面的问题 
1 修改ActivityTestBindingModule 为java文件  结果 ：失败   修改 var改为val  结果：成功
2 修改Activity中的  DataBindingUtil.setContentView<ActivityTestBinding>(this, R.layout.activity_test)  结果：失败
3 修改TestPresenter 删除private申明  结果：编译失败
4 修改TestPresenter  全部加上private 和val 结果：编译失败
5 修改MainPresenter 去掉private 加上val 结果：成功

总结  只需要修改 1和4 两条即可。

多个Activity且为kt生成部分完成      测试是否有问题ING

***********以上的部分 kt生成部分  暂时作废  因为目前有一个无法解决的问题：Kotlin + DataBinding + Dagger2 三者共同存在时 编译时·	NonExistentClass 问题
目前只知道 时kapt的自身限制 
也就是 目前只支持Java + DataBinding + Dagger2 
###======================================================最终解决方案如下=========================================================

这里查明原因如下https://github.com/gen0083/KotlinDaggerDataBinding  
Kotlin + Dagger2 + DataBinding形成的独特的编译期BUG：NonExistentClass
解决方法为不要让Dagger和DataBind同时使用 这是Kapt的一种限制;


为此:
我完成了 Kotlin Java 两个版本的 模板 并且由于DataBinding的限制 java 和 Kotlin 两个版本的基类有所不同 并且不兼容 除非删除DataBinding
###切记 一旦选择好使用哪个版本就不要在更换了

这个是Java代码的 demo
[(app-JAVA)](https://github.com/goodluckforme/muc_mvp/blob/second/app-JAVA.rar)

这个是Kotlin代码的 demo
[(app-Koltin)](https://github.com/goodluckforme/muc_mvp/blob/second/app-Kotlin2.rar)



