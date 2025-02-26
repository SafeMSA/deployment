#!/bin/bash



# If this is NOT the first node, try to join the cluster
if [ "$JOIN_CLUSTER_HOST" != "" ]; then
  sleep 10
  echo "Joining RabbitMQ cluster at $JOIN_CLUSTER_HOST..."
  rabbitmqctl stop_app
  rabbitmqctl join_cluster rabbit@$JOIN_CLUSTER_HOST
  rabbitmqctl start_app
  echo "Cluster status:"
  rabbitmqctl cluster_status
fi

# Keep the container running
exec rabbitmq-server