# elixirdock

## Why you should use it
- Have you ever faced problems setting up an **Elixir-Phoenix-Postgres** development environment?

- Do you think installing **Postgres** in your development system is a tricky business?

- Worried about overloading your system with tons of dependencies and apps, making it slow, less productive?

- Needing a specific version for **Elixir**, **Phoenix** and/or **Postgres** to run your tests and development smoothly?

- Studying an outdated course (ie. [Udemy's The Complete Elixir and Phoenix Bootcamp](https://www.udemy.com/course/the-complete-elixir-and-phoenix-bootcamp-and-tutorial/)) and your exercises are no longer working?

You're not alone! This repo uses containers to set your mind free from dependency problems for this stack.

## Setup instructions

1. Make sure you have `make`, `git`, `docker`, and `docker-compose` installed in your system. If you don't, please follow the instructions provided bellow:

    ### Installing **make**

    #### *Debian/Ubuntu users*
    ```bash
    sudo apt install make
    ```

    #### *Mac users*
    ```bash
    $ brew install make
    ```
    #### *Windows users*

    [http://gnuwin32.sourceforge.net/packages/make.htm](http://gnuwin32.sourceforge.net/packages/make.htm)

    ### Installing **git**

    #### *All users*

    [https://git-scm.com/downloads](https://git-scm.com/downloads)

    ### Installing **docker**

    #### *All users*

    [https://docs.docker.com/get-docker/](https://docs.docker.com/get-docker/)

    ### Installing **docker-compose**

    #### *All users*

    [https://docs.docker.com/compose/install/](https://docs.docker.com/compose/install/)


2. Clone this repository using `git clone` to your development directory and set it as the current directory:

    ```bash
    /your/path$ git clone https://github.com/rocharv/elixirdock.git
    /your/path$ cd elixirdock
    /your/path/elixir_dev$
    ```

3. Edit the provided  `.env` file to customize your versions. The default is to use the last stable version of each software:
    ```bash
    /your/path/elixir_dev$ cat .env

    ```
>Note: Check out the **Reference** section to get help choosing versions that work one another.
4. Build your containers using `make` to gain productivity.
    ```bash
    /your/path/elixir_dev$ make up
    ```

## Reference: Choosing compatible versions

### Postgres
You can choose almost any Postgres version you like. Just as a reminder, Phoenix uses `postgrex` Elixir lib to work.

So please feel free to choose among one of these versions for your Elixir apps:

POSTGRES VERSIONS | COMMENT
-|-
8.4, 9.0-9.6 or later | **hstore** is not supported on 8.4

>Source: https://github.com/elixir-ecto/postgrex

### Elixir and Erlang versions

ELIXIR VERSION | SUPPORTED ERLANG/OTP VERSIONS
-|-
1.0 | 17 - 17 (and Erlang/OTP 18 from v1.0.5)
1.1	| 17 - 18
1.2	| 18 - 18 (and Erlang/OTP 19 from v1.2.6)
1.3	| 18 - 19
1.4	| 18 - 19 (and Erlang/OTP 20 from v1.4.5)
1.5	| 18 - 20
1.6	| 19 - 20 (and Erlang/OTP 21 from v1.6.6)
1.7	| 19 - 22
1.8	| 20 - 22
1.9	| 20 - 22
1.10 | 21 - 22 (and Erlang/OTP 23 from v1.10.3)
1.11 | 21 - 23

>Source: https://hexdocs.pm/elixir/compatibility-and-deprecations.html#compatibility-between-elixir-and-erlang-otp

### Phoenix
Choose a valid release version listed as a tag on the **github** page of **Phoenix**:
https://github.com/phoenixframework/phoenix/releases

If you run into problems, consider choosing an appropriate version of **Elixir**/**Erlang** for each specific version of **Phoenix**.