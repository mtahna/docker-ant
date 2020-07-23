# docker-ant

# Create Docker Image
Do the following when creating an docker image.
```
% make build
```
Can be executed by specifying the Maven version.
For example, execute it for the Maven=1.9.1 version. 
```
% make build ant_ver=1.9.1 jdk_ver=jdk8
```

# Execute Maven Build
Do the following when executing Maven build.
```
% make run -src [Target Source] -cmd [Target Command]
```

Can be executed by specifying the Maven version.
For example, execute it for the "Project" folder. 
```
% make run -src Project -cmd "ant" -mvn_ver=1.10.8 jdk_ver=jdk8
```
