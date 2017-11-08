<?xml version="1.0"?>
<project
        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd"
        xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>{{project.packageName}}</groupId>
        <artifactId>{{project.name}}</artifactId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <version>1.0-SNAPSHOT</version>
    <artifactId>{{project.name}}-service</artifactId>
    <name>{{project.name}}-service</name>
    <packaging>jar</packaging>
    <url>http://maven.apache.org</url>
    <properties>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>
    <dependencies>

        <dependency>
            <groupId>{{project.packageName}}</groupId>
            <artifactId>{{project.name}}-common</artifactId>
            <version>1.0-SNAPSHOT</version>
        </dependency>

        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-core</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-orm</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-remoting</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-aspects</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-test</artifactId>
        </dependency>
        <dependency>
            <groupId>commons-fileupload</groupId>
            <artifactId>commons-fileupload</artifactId>
        </dependency>
        <dependency>
            <groupId>org.aspectj</groupId>
            <artifactId>aspectjweaver</artifactId>
        </dependency>
        <dependency>
            <groupId>commons-httpclient</groupId>
            <artifactId>commons-httpclient</artifactId>
        </dependency>
        <dependency>
            <groupId>com.caucho</groupId>
            <artifactId>hessian</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework</groupId>
            <artifactId>spring-context-support</artifactId>
        </dependency>
        <dependency>
            <groupId>com.baidu.disconf</groupId>
            <artifactId>disconf-client</artifactId>
            <version>2.6.25-SNAPSHOT</version>
            <exclusions>
                <exclusion>
                    <artifactId>org.slf4j</artifactId>
                    <groupId>slf4j-log4j12</groupId>
                </exclusion>
                <exclusion>
                    <artifactId>ch.qos.logback</artifactId>
                    <groupId>logback-classic</groupId>
                </exclusion>
            </exclusions>
        </dependency>
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
        </dependency>
        <!--全局调度服务-->
        <dependency>
            <groupId>com.qdingnet</groupId>
            <artifactId>schedule-client</artifactId>
            <version>0.0.1-SNAPSHOT</version>
        </dependency>

        <dependency>
            <groupId>com.qdingnet</groupId>
            <artifactId>imessage-client</artifactId>
        </dependency>
        <dependency>
            <groupId>com.qding.dictionary</groupId>
            <artifactId>dictionary-client</artifactId>
        </dependency>
    </dependencies>

    <build>
        <pluginManagement>
            <plugins>
                <plugin>
                    <groupId>org.eclipse.m2e</groupId>
                    <artifactId>lifecycle-mapping</artifactId>
                    <version>1.0.0</version>
                    <configuration>
                        <lifecycleMappingMetadata>
                            <pluginExecutions>
                                <pluginExecution>
                                    <pluginExecutionFilter>
                                        <groupId>org.apache.maven.plugins</groupId>
                                        <artifactId>maven-dependency-plugin</artifactId>
                                        <versionRange>[2.0,)</versionRange>
                                        <goals>
                                            <goal>copy-dependencies</goal>
                                        </goals>
                                    </pluginExecutionFilter>
                                    <action>
                                        <ignore />
                                    </action>
                                </pluginExecution>
                            </pluginExecutions>
                        </lifecycleMappingMetadata>
                    </configuration>
                </plugin>
            </plugins>
        </pluginManagement>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-dependency-plugin</artifactId>
                <executions>
                    <execution>
                        <id>copy-dependencies</id>
                        <phase>package</phase>
                        <goals>
                            <goal>copy-dependencies</goal>
                        </goals>
                        <configuration>
                            <outputDirectory>${project.build.directory}/lib</outputDirectory>
                            <excludeTransitive>false</excludeTransitive>
                            <stripVersion>true</stripVersion>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
        </plugins>
    </build>
    <profiles>
        <profile>
            <id>{{project.name}}-dev</id>
            <activation>
                <activeByDefault>true</activeByDefault>
            </activation>
            <properties>
                <qding.log.leval>INFO</qding.log.leval>
                <qding.log.path>D:/output/{{project.name}}</qding.log.path>
                <qding.conf.path>D:/platform/{{project.name}}/</qding.conf.path>
            </properties>
        </profile>

        <profile>
            <id>online</id>
            <properties>
                <qding.log.leval>INFO</qding.log.leval>
                <qding.log.path>/data/logs/{{project.name}}</qding.log.path>
                <qding.conf.path>/data/qdconf/{{project.name}}/</qding.conf.path>
            </properties>
        </profile>
    </profiles>
</project>