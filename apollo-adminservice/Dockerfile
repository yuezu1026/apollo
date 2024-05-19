FROM ubuntu-zulu-jdk17

# 复制编译后的Spring Boot应用到容器中
COPY target/apollo-adminservice-2.3.0-SNAPSHOT.jar /app.jar

# 运行Java应用
ENTRYPOINT ["java", "-jar", "/app.jar"]
