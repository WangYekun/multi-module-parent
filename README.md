### 一、项目结构
multi-module-parent是主工程，里面包含两个模块（Module）：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602215215233.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)

module-web是应用层，用于界面展示，依赖于module-core参的服务。
module-core层是服务层，用于给web层提供服务。

> 跟java的package类似，一般是按照的功能模块分module，比如：sso/cas/portal/activity/system，具体可根据需要

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602215558604.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
**以上两种方式都可以，现在更多的应该是倾向第一种按照功能来解耦，module前期可以配置成jar，后期也可以建立独有的页面，独立的站点，通过子域名的方式访问，各个功能模块解耦，趋向微服务架构**

### 二、构建项目
#### 2.1 Parent Project
新建一个空白标准maven project（不要选择Create from archetype选项）
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602220510248.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
填写项目坐标，得到一个标准的maven项目，因为该项目是作为一个Parent project存在的，可以直接删除src文件夹（父文件下只有自己的pom文件和模块文件）。
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602220636984.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
#### 2.2 增加module-web模块（Module）
选择从archetype创建（选择webapp选项）
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602221002193.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
groupId和version继承自Parent project，这里只需要填写artifactId即可。
![在这里插入图片描述](https://img-blog.csdnimg.cn/2019060222113815.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)

> 注意：这里Add as module to
> 有的人会删除，如果删除了创建的模块文件就会和父模块（parent）同级了，这里看个人喜欢。文件夹结构怎么样都行，重要的pom文件里面的父子结构要设置正确。

![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602221601845.png)

#### 2.3增加module-core模块
用同样的方法创建module-core模块（不过该模块是一个空白maven标准项目，不要从archetype创建）
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602222146453.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
#### 2.4 得最终项目结构
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602222303794.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
#### 2.5 关键几点
1，Parent project和各个Module拥有独立pom文件
2，Parent project用于组织不同的Module，不实现逻辑
3，Module集成Parent project的groupId和version，Module只需要指定自己的artifactId即可。

### 三、添加项目依赖
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602222716314.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602222740309.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
上面的操作是添加web对core模块的依赖，完成上述操作后core中public的类已经在web模块中可见了，如果不加模块依赖，web下的jsp用不了core里面的方法，会抱错：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602223302223.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)

此外还需要在web的pom文件中增加对core的依赖，这个主要是为了web里面的Java模块调用core的服务：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602223716740.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
以上，项目依赖的添加已经完成。
### 四、开始编程
#### 4.1 module-core模块编程
在core模块中增加一个Service类（SimpleService.java):
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602223911805.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
#### 4.2 module-web模块编程
修改web下的jsp文件，调用core服务：
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602224531335.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
### 五、运行
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602224634759.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
![在这里插入图片描述](https://img-blog.csdnimg.cn/20190602224816882.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3UwMTA2MzMyNjY=,size_16,color_FFFFFF,t_70)
如果想了解热部署和继承关系等配置请看：
IntelliJ Idea14 创建Maven多模块项目，多继承，热部署配置总结（二）

### 博客地址：https://blog.csdn.net/u010633266/article/details/90745753
