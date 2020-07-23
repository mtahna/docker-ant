# docker-ant

# Create Docker Image
Do the following when creating an docker image.
```
% make build
```
Can be executed by specifying the Ant version.
For example, execute it for the Ant=1.10.7 version. 
```
% make build ant_ver=1.10.7 jdk_ver=jdk8
```

# Execute Ant Build
Do the following when executing Ant build.
```
% make run src=[Target Source] cmd=[Target Command]
```

Can be executed by specifying the Ant version.
For example, execute it for the "Project" folder. 
```
% make run src=Project cmd="ant" ant_ver=1.10.7 jdk_ver=jdk8
```
