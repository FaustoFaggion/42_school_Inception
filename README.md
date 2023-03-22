# 42_school_Inception

<div align="justify">
This project aims to broaden your knowlege of system administration by using Docker.
<div>

<br>

## What is Docker? 
---

<div align="center">

![alt text](img/docker.png)

<div>

<div align="justify">
Docker is a platform that enables developers to easily create, deploy, and run applications in a containerized environment. Containers are lightweight, portable, and self-contained environments that contain all the necessary dependencies and configuration files to run an application.

Docker allows developers to package an application and its dependencies into a single container, which can then be deployed on any platform that supports Docker. This makes it easier to move applications between different environments, from development to testing to production, without the need for manual configuration or installation of dependencies.

Docker also provides a centralized repository called Docker Hub, where developers can share and download pre-built Docker images for popular applications and frameworks. This helps to reduce the time and effort required to set up a development environment, as developers can simply download the necessary Docker images and start building their application immediately.
<div>

<br>

## What is Wordpress?
---

<div align="center">
	
![alt text](img/wordpress.png)

<div>

<div align="justify">
WordPress is a popular open-source content management system (CMS) that allows users to easily create and manage websites, blogs, and online stores. It was first released in 2003 and has since become the most widely used CMS, powering over 40% of all websites on the internet.

WordPress provides users with a user-friendly interface and a wide range of customization options, making it easy for anyone to create a website without needing to know how to code. It also has a vast ecosystem of plugins and themes, which can be used to extend the functionality of a website or change its design.

WordPress is written in PHP and uses a MySQL database to store content. It can be installed on any web server that supports PHP and MySQL, making it a versatile platform that can be used by businesses, bloggers, and developers alike.
<div>

<br>

## Docker Install Using the Repository
---

1.  Became Sudo in  Debian

	- Login as root - ``` su```

	- Install sudo - ```apt install sudo```

	- Add user - ```/sbin/adduser <user> sudo```

2. Switch user

	- su - < user >

3. Update apt
	
	- ```sudo apt update ```
	- ```sudo apt-get update ```

4. Install packages to allow ```apt``` to use the repository over HTTPS

	- ```sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release```

5. Add Docker's official GPG key

	- ```wget https://download.docker.com/linux/debian/gpg```
	- ```sudo apt-key add pgpg```

6. Set up the Docker Repository

	- ```echo "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list```
	- ```sudo apt update ```
	- ```sudo apt-get update ```

7. Install Docker Engine, containerd and Docker Compose

	- ```sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin```

8. Check Docker Runing Status

	- ```sudo systemctl status docker```

