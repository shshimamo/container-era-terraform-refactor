[
  {
    "name": "sample-webapp",
    "image": "543795826793.dkr.ecr.ap-northeast-1.amazonaws.com/container-era-image:latest",
    "cpu": 200,
    "memory": null,
    "memoryReservation": 600,
    "essential": true,
    "command": ["bundle", "exec", "rake", "db:create", "db:migrate"],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "container-era-service",
        "awslogs-region": "ap-northeast-1",
        "awslogs-stream-prefix": "migration"
      }
    },
    "environment": [],
    "secrets": [
      {
        "name": "DB_HOST",
        "valueFrom": "CONTAINER_ERA_DB_HOST"
      },
      {
        "name": "DB_USER",
        "valueFrom": "CONTAINER_ERA_DB_USER"
      },
      {
        "name": "DB_PASSWORD",
        "valueFrom": "CONTAINER_ERA_DB_PASSWORD"
      },
      {
        "name": "RACK_ENV",
        "valueFrom": "CONTAINER_ERA_APP_ENV"
      }
    ]
  }
]
