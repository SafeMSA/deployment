# **Deployment**

This repository contains the deployment configuration for a **Microservices Architecture (MSA)** that communicates over **RabbitMQ**. The system is containerized using **Docker Compose**, making it easy to deploy locally or on a server.

## **How to Set Up**
To run the system, ensure you have **Docker** and **Docker Compose** installed. Then, execute:

```sh
docker compose up -d
```

This will start all required services.

To stop all services:
```sh
docker compose down
```

---

## **RabbitMQ Monitoring**
### **Prometheus**
Prometheus is used to scrape metrics from RabbitMQ and other services.

- **URL:** [http://localhost:9090](http://localhost:9090)
- Default port: **9090
- Query example: `rabbitmq_queue_messages` (shows messages in the queue)

### **Grafana**
Grafana provides dashboards to visualize RabbitMQ and system performance.

- **URL:** [http://localhost:3000](http://localhost:3000/d/Kn5xm-gZk/rabbitmq-overview?orgId=1&from=now-15m&to=now&timezone=browser&var-DS_PROMETHEUS=default&var-namespace=&var-rabbitmq_cluster=rabbit@rabbitmq1&refresh=15s)
- Default login: **admin / admin**
