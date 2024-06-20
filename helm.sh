#!/bin/bash

cd charts

# 对charts目录下的所有子目录执行helm package ./目录
for dir in */; do
    if [ -d "$dir" ]; then
        helm package "./$dir"
    fi
done

cd ../

helm repo index --url https://nisainan.github.io/helm-charts/charts ./charts

mv charts/index.yaml ./index.yaml
