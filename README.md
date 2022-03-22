# SSM-CRUD
整合SSM框架实现基本增删改查功能

功能点：

* 分页
* 数据校验
* ajax
* 使用HTTP协议请求方式的动词，标识对资源的操作
  * GET(查询)
  * POST(新增)
  * PUT(修改)
  * DELETE(删除)）

# 1 环境搭建

* 1.创建Maven工程

  * 正常创建一个maven工程即可，建议选用maven-app，需要自己创建java和resources文件夹

* 2.引入项目依赖包

  * 2.1 pom.xml中需要引入的包
    * spring，spring-mvc，mybatis，数据库连接池，驱动包
    * jstl, servlet-api, junit

* * 2.2 通过properties设置依赖包版本

  ```xml
  <!--通过properties设置spring版本一致可避免一些不必要的错误-->
  <!--指定jdk版本避免出错-->
  <!--引入依赖-->
  <properties>
      <maven.compiler.target>1.8</maven.compiler.target>
      <maven.compiler.source>1.8</maven.compiler.source>
      <junit.version>5.7.0</junit.version>
      <spring.version>5.3.4</spring.version>
  </properties>
  ```

  * 2.3 spring相关依赖

    ```xml
    <!-- 引入Spring MVC模块 -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-webmvc</artifactId>
        <version>${spring.version}</version>
    </dependency>
    <!-- 引入Spring JDBC模块 -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-jdbc</artifactId>
        <version>${spring.version}</version>
    </dependency>
    <!-- Spring事务控制 -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-tx</artifactId>
        <version>${spring.version}</version>
    </dependency>
    <!-- aspectj解析切入点表达式 -->
    <dependency>
        <groupId>org.aspectj</groupId>
        <artifactId>aspectjweaver</artifactId>
        <version>1.9.6</version>
    </dependency>
    <!-- Spring测试模块(整合Junit) -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-test</artifactId>
        <version>${spring.version}</version>
    </dependency>
    ```

  * 2.4 数据库、数据库连接池级mybatis相关依赖

    ```xml
    <!-- Mybatis Generator代码生成器 -->
    <dependency>
        <groupId>org.mybatis.generator</groupId>
        <artifactId>mybatis-generator-core</artifactId>
        <version>1.4.0</version>
    </dependency>
    <!-- mybatis-spring适配包 -->
    <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis-spring</artifactId>
        <version>2.0.6</version>
    </dependency>
    <!-- Mybatis操作数据库 -->
    <dependency>
        <groupId>org.mybatis</groupId>
        <artifactId>mybatis</artifactId>
        <version>3.5.6</version>
    </dependency>
    <!-- MySQL驱动 -->
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>5.1.47</version>
    </dependency>
    <!-- Druid连接池 -->
    <dependency>
        <groupId>com.alibaba</groupId>
        <artifactId>druid</artifactId>
        <version>1.2.5</version>
    </dependency>
    <!-- mybatis-ehcache适配包 -->
    <dependency>
        <groupId>org.mybatis.caches</groupId>
        <artifactId>mybatis-ehcache</artifactId>
        <version>1.2.1</version>
    </dependency>
    <!-- slf4j-simple (mybatis-ehcache需要这个包) -->
    <dependency>
        <groupId>org.slf4j</groupId>
        <artifactId>slf4j-simple</artifactId>
        <version>1.7.30</version>
    </dependency>
    ```

  * 2.5 jstl, servlet-api, junit相关依赖

    ```xml
    <!-- 引入JSTL, Servlet, Junit等基础依赖 -->
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>jstl</artifactId>
        <version>1.2</version>
    </dependency>
    <dependency>
        <groupId>org.apache.taglibs</groupId>
        <artifactId>taglibs-standard-impl</artifactId>
        <version>1.2.5</version>
    </dependency>
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>4.0.1</version>
        <scope>provided</scope>
    </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-api</artifactId>
        <version>${junit.version}</version>
        <scope>test</scope>
    </dependency>
    <dependency>
        <groupId>org.junit.jupiter</groupId>
        <artifactId>junit-jupiter-engine</artifactId>
        <version>${junit.version}</version>
        <scope>test</scope>
    </dependency>
    ```


* 3.引入bootstrap框架

  * 建议直接复制views文件夹到自己的WEB-INF文件夹下

* 4.编写ssm整合关键配置文件

  * web.xml

  * ```xml
    <!--此处需要在/WEB-INF/分别创建springmvc.xml及applicationContext.xml文件-->
    <?xml version="1.0" encoding="UTF-8"?>
    <web-app xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
             xmlns="http://xmlns.jcp.org/xml/ns/javaee"
             xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee 
             http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
             version="4.0">
        
        <!--1.启动Spring的容器-->
        <!-- 配置ContextLoaderListener, 加载Spring父容器 -->
        <context-param>
            <!-- 指定Spring配置文件位置 -->
            <param-name>contextConfigLocation</param-name>
            <param-value>/WEB-INF/applicationContext.xml</param-value>
        </context-param>
        
        <!--2.Spring MVC的前端控制器，拦截所有请求-->
        <listener>
            <!-- 该监听器将根据contextConfigLocation参数加载Spring配置文件, 初始化Spring应用上下文 -->
            <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
        </listener>

        <!--3.配置DispatcherServlet, 加载Spring MVC子容器 -->
        <servlet>
            <servlet-name>springmvc</servlet-name>
            <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
            <init-param>
                <!-- 指定Spring MVC配置文件位置, 默认是 /WEB-INF/<servlet-name>-servlet.xml -->
                <param-name>contextConfigLocation</param-name>
                <param-value>/WEB-INF/springmvc.xml</param-value>
            </init-param>
            <!-- 随Tomcat一起启动 -->
            <load-on-startup>1</load-on-startup>
        </servlet>
        <!--4.配置springmvc servlet映射器-->
        <servlet-mapping>
            <servlet-name>springmvc</servlet-name>
            <!-- / 接收所有请求, 除了jsp -->
            <!-- /* 接收所有请求, 包括jsp -->
            <url-pattern>/</url-pattern>
        </servlet-mapping>

        <!-- 5.配置字符编码过滤器, 用于设置请求和响应的编码 -->
        <!-- 该过滤器必须配置在所有过滤器之前!! -->
        <filter>
            <filter-name>CharacterEncodingFilter</filter-name>
            <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
            <!--UTF-8编码-->
            <init-param>
                <param-name>encoding</param-name>
                <param-value>UTF-8</param-value>
            </init-param>
            <!-- 强制设置响应编码, 不强制设置请求编码(当请求中未指定编码时才设置) -->
            <init-param>
                <param-name>forceResponseEncoding</param-name>
                <param-value>true</param-value>
            </init-param>
        </filter>
        <filter-mapping>
            <filter-name>CharacterEncodingFilter</filter-name>
            <url-pattern>/*</url-pattern>
        </filter-mapping>

        <!-- 6.配置HTTP方法过滤器, 实现REST风格的增删改查 -->
        <!-- 将页面的post请求转为指定的delete或者put请求-->
        <!-- 该过滤器根据指定的请求参数(默认是"_method")来修改请求的类型 -->
        <filter>
            <filter-name>HiddenHttpMethodFilter</filter-name>
            <filter-class>org.springframework.web.filter.HiddenHttpMethodFilter</filter-class>
        </filter>
        <filter-mapping>
            <filter-name>HiddenHttpMethodFilter</filter-name>
            <url-pattern>/*</url-pattern>
        </filter-mapping>
    </web-app>
    ```


  * spring-mvc的配置，作为 前端控制器，拦截所有请求，负责网站跳转逻辑，配置

  ```xml
  1
  ```

  * spring 启动Spring的容器， applicationContext.xml的配置


  ```xml
  1
  ```

  * dbconfig.properties配置

  ```properties
  1
  ```

  * mybatis-config.xml

  ```xml
  1
  ```

  * mybatis逆向工程生成对应的bean及mapper











































































































































































































































