#Docker images for the ELK stack

##Getting started
```vagrant up
vagrant ssh
cd /vagrant
docker-compse up -d
docker-compose ps```

then open browser at http://localhost:8080

## 2 plugins are installed.
###head plugin
you can visit `http://localhost:9200/_plugin/head/`
![Head plugin](https://cloud.githubusercontent.com/assets/8790813/7987076/d93bdbba-0b0d-11e5-854e-2e02233f81ab.png)


###bigdesk plugin
you can visit `http://localhost:9200/_plugin/bigdesk/`
![Bigdesk plugin](https://cloud.githubusercontent.com/assets/8790813/7987166/501c7082-0b0e-11e5-87ba-ed6cc6e4bc9d.png)
