# CourseDesign

&emsp;&emsp;大二的软件工程课程设计+数据库大作业，校园二手交易平台，前后端分离项目，包含相关文档和PPT。

### 环境

- Vue:2.x
- node:16
- JDK:11
- MySQL:8

### 技术栈

##### 前端(Vue+Element-UI)

- Vue
- Element-UI
- Axios
- echarts

##### 后端(SSM)

- SpringBoot
- SpringMVC
- MyBatis-Plus
- MySQL
- Druid
- swagger

### 运行

> 克隆本项目至本地

```
git clone https://github.com/NingNing0111/CourseDesign.git
```

> 执行sql文件(建议用数据库管理工具执行，如：Navicat)

```sql
mysql -h host -u username -p password database_name < file.sql
```

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.4270kv0ge5a0.png)


#### 启动后端

##### 方法一：直接运行Jar包

> cmd窗口执行

```
java -jar software-project-0.0.1-SNAPSHOT.jar --server.port=端口号 --spring.datasource.url=数据库url --spring.datasource.password=数据库密码
```

> jar包的启动参数具体请参照[application.yml](https://github.com/NingNing0111/CourseDesign/blob/main/software-project-back/src/main/resources/application.yml)文件

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.6qfkjfikqng0.webp)

> 浏览器访问：localhost:端口号/goods/all，默认为[localhost:8888/goods/all](localhost:8888/goods/all)

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.29lse2od31q8.webp)

> 若能正常拿到数据 则说明后端启动成功

##### 方法二：IDEA打开software-project-back项目

> 用IDEA打开software-project-back项目，下载完所有依赖后，直接运行SpringBootApplication即可。

#### 启动前端

> 下载依赖

```
cd software-project-front
npm install 
```

> 下载较慢的话可以使用镜像下载

```
npm config set registry https://registry.npm.taobao.org

npm install
```

> 启动

```
npm run serve
```

### 效果图

#### 首页

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.3n7moufemgk0.webp)

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.6vc46zsy2ws0.webp)

#### 用户后台界面

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.57ntu7i2rrk0.webp)

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.2nt41fc4f5y0.webp)

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.50v58z3mrqc0.webp)

#### 管理员

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.3uq3zq7ob9q0.webp)

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.3uq3zq7ob9q0.webp)

![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.5js4f8hkiks0.webp)


![](https://cdn.staticaly.com/gh/NingNing0111/picx-images-hosting@master/校园二手交易系统/image.24km4vdb9lds.webp)

### 其它信息

- 本人双非学校，大二的课程设计，老师的要求并不高，只把后台核心的操作（增删改查）实现了，商品评论功能未实现。
- 管理员后台界面在前端被写死了，**只要nickname为admin，进入到后台后就能看到用户管理**。
- 项目存在很多的Bug，课程设计要求高的朋友还望理解，但学校很水的话，那么本项目或许对你有帮助。