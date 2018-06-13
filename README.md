# Dockerized AWS CLI Tools

This image will let you run AWS CLI tools without installing the AWS CLI on your local machine.

A few pre-requisites to get this to work properly:

* You need your AWS credentials. See this [link](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html) to set it up. You do not have to have AWS CLI installed on your system but for this container to work you will need to have the config and credentials file ready to be read.

* Security note: Container does not run as root. 

* Once your AWS creds are ready then run this command:

    `docker run --rm -it -v <path to your credentials>/.aws/:/home/awscli/.aws:rw  valien/docker-aws-cli "/bin/sh"`

    Key:

    * `--rm` --> removes container 
    * `-it` --> makes container interactive
    * `-v` --> mounts your local folder to the container
    * `:ro` --> makes that mounted volume read-only (note: If you use `aws-shell` then you'll need to make this directory `:rw` so that it can write history and work properly.) 
    * `/bin/sh` --> the shell that Alpine uses

* You can run this container two ways:
    1. Interactive - drops you into the container and you run your AWS commands as necessary from the CLI or you can run `aws-shell` to use the Amazon AWS Shell utility.
    2. Temporary - run the container by passing variables via the `docker run` commands
    
Modified from this repo - https://github.com/sekka1/aws-cli-docker
