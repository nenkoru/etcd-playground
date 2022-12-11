






Reproduce env:
1. docker network create etcd-cluster-network
2. docker-compose up -d -f docker-compose.discovery.yml
3. docker ps and get id of etcd-discovery cluster
4. docker exec -ti <id> curl http://etcd-discovery:80/new?size=3
5. Get the output url of the command
6. Change the ETCD_DISCOVERY to the url you got previously in .env
7. docker-compose up -d -f docker-compose.yml
8. Check if everything works by getting any of etcd-0 container ids and execute: docker exec -ti <id> etcdctl put greeting \"text\"
9. And from another container of those from etcd-0: docker exec -ti <id> etcdctl get greeting


