# dev_elixir

## Why should you use it?
Have you ever faced problems setting up an **Elixir-Phoenix-Postgres** development environment?

You're not alone! This repo uses containers to set your mind free from dependency problems for this stack.

These are plenty of reasons to use this:
- Sometimes your application needs a specific version for **Elixir**, **Phoenix** and/or **Postgres** to run smoothly.

- You are studying an outdated course (ie. [Udemy's The Complete Elixir and Phoenix Bootcamp](https://www.udemy.com/course/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/)) and your exercises are no longer working.

- **Postgres** can be really boring to install in some systems.

So my goal here is to help you set a development environment using only 2 containers:
- **postgres_service**

- **elixir_service**

## Step-by-step instructions

1. Make sure you have `make`, `git`, `docker`, and `docker-compose` installed in your system. If you don't, please follow the instructions provided bellow:
    ___
    ### Installing **make**

    #### *Debian/Ubuntu users*
    ```bash
    sudo apt install make
    ```

    #### *Mac Users*
    ```bash
    $ brew install make
    ```
    #### *Windows users*

    [http://gnuwin32.sourceforge.net/packages/make.htm](http://gnuwin32.sourceforge.net/packages/make.htm)

    ___
    ### Installing **git**

    #### *All users*

    [https://git-scm.com/downloads](https://git-scm.com/downloads)

    ___
    ### Installing **docker**

    #### *All users*

    [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

    ___
    ### Installing **docker-compose**

    #### *All users*

    [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)

    ___

2. Clone this repository using `git clone` to your development directory and set it as the current directory:

    ```bash
    /your/path$ git clone https://github.com/rocharv/dev_elixir.git elixir_dev
    /your/path$ cd elixir_dev
    /your/path/elixir_dev$
    ```

6. If you follow every previous step, your directory structure will look like this:

    ```bash
    /your/path/app-bundle$ tree
    .
    ├── docker
    │   ├── elixir
    │   └── postgres
    ├── elixir_apps
    └── postgres_data
