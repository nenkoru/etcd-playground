etcd \
--name $HOSTNAME \
--initial-advertise-peer-urls http://$HOSTNAME:2380 \
--listen-peer-urls http://0.0.0.0:2380 \
--listen-client-urls http://0.0.0.0:2379 \
--advertise-client-urls http://$HOSTNAME:2379 

