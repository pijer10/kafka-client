# kafka-client
Simple Alpine OpenJDK Container with Java and Kafka.
Can act as kafka client. It should have /etc/hosts file enabled in order to reach Zookeeper addresses.

## Start as a background Docker Container

Since it has Entrypoint `/bin/sh` you should add background and interactive flags in order to start it correctly:

`docker run -d -it --name kafka-client-container pijer10/kafka-client:latest`

To enter into this container, use:
`docker exec -it kafka-client /bin/bash`

## Start as a foreground Docker Container

Use this command:
`docker run pijer10/kafka-client:1.x bin/crete-topic.sh ...`

## Start it as a Kubernetes Deployment Object

Use this Deployment structure:
```
apiVersion: apps/v1 
kind: Deployment
metadata:
  name: kafka-client
spec:
  selector:
    matchLabels:
      app: kafka-client
  template:
    metadata:
      labels:
        app: kafka-client
    spec:
      containers:
      - name: aws-cli-container
        image: pijer10/kafka-client:latest
        command: ["tail"]
        args: ["-f", "/dev/null"]
```
