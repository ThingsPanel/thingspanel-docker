# 问题咨询

- 感谢您的使用和支持，有任何疑问请加群咨询，加qq群请备注需要咨询的问题，我们会在通过的第一时间回复您问题
- QQ群2：371794256

# FAQ

## 无法拉取镜像问题

- **替换镜像仓库**
  
  将docker-compose.yml文件中的ghcr.io/thingspanel替换为registry.jihulab.com/thingspanel/docker-images
    ```bash
      sed -i 's#ghcr.io/thingspanel#registry.jihulab.com/thingspanel/docker-images#g' docker-compose.yml
    ```
