curl -X POST -H "Content-Type: application/json" --data @config/connector_pageviews.config http://localhost:8083/connectors
curl -X POST -H "Content-Type: application/json" --data @config/connector_users_protobuf.config http://localhost:8083/connectors
curl -X POST -H "Content-Type: application/json" --data @config/connector_pageviews-avro.config http://localhost:8083/connectors
