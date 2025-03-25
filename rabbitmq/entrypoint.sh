#!/bin/bash

# Start RabbitMQ server in the background
rabbitmq-server &

# Wait for RabbitMQ to be fully up before continuing
echo "Waiting for RabbitMQ to start..."
until rabbitmqctl status; do
  sleep 1
done

# If this is NOT the first node, try to join the cluster
if [ "$JOIN_CLUSTER_HOST" != "" ]; 
then
  echo "Waiting for cluster host to launch..."
  sleep 5
  echo "Joining RabbitMQ cluster at $JOIN_CLUSTER_HOST..."
  rabbitmqctl forget_cluster_node
  rabbitmqctl set_policy ha-all ".*" '{"ha-mode":"all","ha-sync-mode":"automatic"}'
  rabbitmqctl stop_app
  rabbitmqctl join_cluster rabbit@$JOIN_CLUSTER_HOST
  rabbitmqctl start_app
  echo "Cluster status:"
  rabbitmqctl cluster_status
else
  rabbitmqctl add_user myuser mypassword
  rabbitmqctl set_user_tags myuser administrator
  rabbitmqctl set_permissions -p / myuser ".*" ".*" ".*"
  echo "Custom RabbitMQ user created: myuser"
fi

wait

# Keep the container running
#exec rabbitmq-server