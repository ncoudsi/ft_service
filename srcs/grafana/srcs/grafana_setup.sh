#!/bin/sh

mkdir -p grafana/data
cp grafana.db grafana/data
cd grafana/bin
./grafana-server
