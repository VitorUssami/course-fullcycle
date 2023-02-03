# [Course-FullCycle][Docker] Challenge - Nginx + Node.js


<img src="https://img.shields.io/badge/FullCycle-000000?style=plastic"  /> 
<img src="https://img.shields.io/badge/Node.js-339933?style=plastic&logo=Node.js&logoColor=white" /> 
<img src="https://img.shields.io/badge/NGINX-009639?style=plastic&logo=NGINX&logoColor=white" /> 
<img src="https://img.shields.io/badge/Docker-2496ED?style=plastic&logo=Docker&logoColor=white" /> 


## Summary

> In this challenge, you'll put into practice what you've learned about using nginx as a reverse proxy. 
> 
> The main idea is that when a user hits nginx, it'll foward to our node.js application. This application, in turn, will insert a record to our mysql database, registering a random name in the _people_ table.
> 
> The return from the node.js application to nginx should be:
> ```
> <h1>Full Cycle Rocks!</h1>
> - List of names registered in the database.
> ```
> 
> Generate docker-compose in a way that we just need to run using: 
> > docker-compose up -d 
> 
> **Everything should be working and running on port: 8080.**
> 
>  _Upload everything to a repository and submit to validation._
>
> _* The programming language for this challenge is Node/JavaScript._
> _Have fun!_

-----

### Build and Run

```
docker-compose up -d --build
```
### Stop

```
docker-compose down --remove-orphans
```

### Docker Hub

* Login
    > ```
    > docker login
    > ```

* Push

    > ```
    > docker push {{your-user}}/challenge-nginx-node
    > ```

* Pull

    > ```
    > docker pull {{your-user}}/challenge-nginx-node
    > ```

-----

### **What I've learned**

During this challenge I've learned how to use Docker Compose to build and run multiple containers.

How to use Dockerize to make one container wait for another.
