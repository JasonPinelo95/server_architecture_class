# CASSANDRA WORKSHOP

## Learn the basics of cassandra

This workshop is a hands-on introduction to cassandra. It is designed to be run on a single machine, but can be run on multiple machines as well.

## You will learn

* How to install cassandra
* How to start cassandra
* How to create a keyspace
* How to create a table
* How to insert data
* How to query data
* How to update data
* How to delete data

## Prerequisites

* Docker
* Docker Compose
* Python 
* Python virtualenv
* Google Cloud Platform account
* Basic knowledge of Linux
* Bash shell
* Networking knowledge
* SSH knowledge

## Running the workshop

### Setup

Generate your ssh keys, go to [sshKeys.md](sshKeys.md) for guidance.

You need to have a Google Cloud Platform account. You can create one for free [here](https://cloud.google.com/free/).

You also need to have a Google Cloud Platform project. You can create one [here](https://console.cloud.google.com/projectcreate).

Create a new VM instance on Google Cloud Platform. You can do this [here](https://console.cloud.google.com/compute/instancesAdd).

Select the following options:
* Name: postgres_docker_workshop
* Region: us-central1
* Zone: us-central1-c
* Machine type: e2-standard-2 (2 vCPUs, 8 GB memory)
* Boot disk: Ubuntu 20.04 LTS (x86_64)
* On Advanced Options -> Security -> Manage Access, click on **+ ADD ITEM** and copy-paste your ssh public key.
* Click on "Create"

SSH into the VM instance. You can do this by opening a terminal and running the following command:

```$ ssh -i ~/.ssh/<NAME_OF_PUBLIC_KEY> <USERNAME>@<EXTERNAL_IP> ```

Once you are SSHed into the VM, run the following commands one by one:

```$ sudo apt-get update```

```$ sudo apt-get upgrade```

```$ git clone https://github.com/JasonPinelo95/cassandra_workshop.git```

```$ cd cassandra_workshop```

```$ chmod +x givePermissions.sh```

```$ ./givePermissions.sh```

```$ ./installDocker.sh```

```$ ./installPy.sh```

```$ source ~/.profile```

```$ ./installDependencies.sh```

```$ source ~/.profile```


### Running the workshop

```$ sudo docker-compose up -d```

After the containers are up and running, you can check the status of the containers by running the following command:

```$ sudo docker-compose exec cassandra_one nodetool status```

After checking the status of the containers, run:

```$ jupyter-notebook --no-browser --port=8080```

Then setup an SSH tunnel to the VM instance. You can do this by running the following command:

```$ ssh -i ~/.ssh/<NAME_OF_PRIVATE_KEY> -L 8080:localhost:8080 <USERNAME>@<EXTERNAL_IP>```

Open a browser and go to [localhost:8080](localhost:8080). You should see the Jupyter Notebook interface.

Follow the instructions in the [notebook](intro_to_cassandra.ipynb).




