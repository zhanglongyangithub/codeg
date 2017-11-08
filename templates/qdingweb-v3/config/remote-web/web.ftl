<web-app xmlns="http://java.sun.com/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee
                      http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
         version="3.0"
         metadata-complete="true">

	<servlet>
	    <servlet-name>remote</servlet-name>
	    <!-- 使用Spring的代理Servlet -->
	    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>

	    <init-param>
			<param-name>contextConfigLocation</param-name>
            <param-value>
                classpath:applicationContext*.xml,classpath:applicationContext-common.xml,classpath:applicationContext-jdbc.xml,classpath:applicationContext-service.xml,classpath:applicationContext-remote-servlet.xml
            </param-value>
		</init-param>

	    <load-on-startup>1</load-on-startup>
	</servlet>

	<servlet-mapping>
	    <servlet-name>remote</servlet-name>
	    <url-pattern>/remote/*</url-pattern>
	</servlet-mapping>

    <filter>
        <filter-name>Spring character encoding filter</filter-name>
        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>
        <init-param>
            <param-name>encoding</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
    </filter>

    <filter-mapping>
        <filter-name>Spring character encoding filter</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>

	<welcome-file-list>
		<welcome-file>index.jsp</welcome-file>
	</welcome-file-list>
</web-app>