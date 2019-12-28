#!/bin/bash

# EC2にはuser_dataというインスタンスが立ち上がった時に実行されるスクリプトを書くことができる
# それを利用してECS_CLUSTERをセットする
echo ECS_CLUSTER=container-era-ecs-cluster >> /etc/ecs/ecs.config
