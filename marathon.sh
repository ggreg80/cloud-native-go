#!/bin/sh
cat > $APP_NAME.json <<EOF
{
    "id": "/$APP_NAME",
    "instances": 3,
    "container": {
        "type": "DOCKER",
        "docker": {
            "image": "$APP_IMAGE",
            "network": "BRIDGE",
            "forcePullImage": true,
            "portMappings": [
                {
                    "containerPort": 8080,
                    "hostPort": 0,
                    "protocol": "tcp"
                }
            ]
        }
    },
    "healthChecks": [{
        "protocol": "TCP",
        "gracePeriodSeconds": 600,
        "intervalSeconds": 30,
        "portIndex": 0,
        "timeoutSeconds": 10,
        "maxConsecutiveFailures": 2
    }],
    "ports": [0],
    "cpus": 0.5,
    "mem": 64.0
}
EOF