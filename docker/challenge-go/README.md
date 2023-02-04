# [Course-FullCycle][Docker] Challenge - GO

<p style="float:left">
    <img src="https://img.shields.io/badge/FullCycle-000000?style=plastic"  /> 
    <img src="https://img.shields.io/badge/Go-00ADD8?style=plastic&logo=Go&logoColor=white" /> 
    <img src="https://img.shields.io/badge/Docker-2496ED?style=plastic&logo=Docker&logoColor=white" /> 
</p>

## Summary

> This challenge is very exciting especially if you have never worked with the Go language!
>
> You will publish an image to docker hub. When we run:
>> docker run {{your-user}}/fullcycle
> 
> We **must** have the following result: Full Cycle Rocks!!
> 
> As you notice, this image only prints a message as final result, so it's worth checking out Go Lang's own website to learn how to build a "hello world".
> 
> Remembering that Go Lang has official images ready to use, it is worth checking out the Docker Hub.
> 
> The final image **must** be less than 2MB =)
> 
> 
> _Have fun!_

-----

### Build 

```
docker build -t {{your-user}}/challenge-go .
```
### Run

```
docker run --rm {{your-user}}/challenge-go
```

### Docker Hub

Check it on [Docker Hub Image](https://hub.docker.com/r/vitorussami/challenge-go) or pull it using:

> docker pull vitorussami/challenge-go



* Login
    > ```
    > docker login
    > ```

* Push

    > ```
    > docker push {{your-user}}/challenge-go
    > ```

* Pull

    > ```
    > docker pull {{your-user}}/challenge-go
    > ```

-----

### **What I've learned**

During this challenge I've learned how to build a very simple GO application and pack it into a tiny Docker image.
