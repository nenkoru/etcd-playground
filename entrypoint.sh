etcd \
--name $_ETCD_NAME \
--initial-cluster-state new \
--initial-cluster $_ETCD_CLUSTER \
--initial-cluster-token etcd-cluster-1 \
--initial-advertise-peer-urls http://$_ETCD_NAME:2380 \
--listen-peer-urls http://0.0.0.0:2380 \
--listen-client-urls http://0.0.0.0:2379 \
--advertise-client-urls http://0.0.0.0:2379
