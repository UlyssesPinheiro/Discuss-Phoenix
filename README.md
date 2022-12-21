# Discuss

Discuss is an app for posting topics and discussions. It has user sign in with authentication (Github OAuth) and a database that connects users to topics they posted, they can create, read, update and delete their own post but not the post from other users.

## Install and setup

### Install PostgreSQL using the username and password.

Username: "postgres"
Password: "u5p#RkrN@!2SbEw!"

### Inside PgAdmin (PostgreSQL)

Create the database "discuss_dev"

### Create a "prod.secret.exs" file iside discuss-phoenix/config folder.

Inside of it, place YOUR github OAuth API key like this:

`use Mix.Config`

`config :discuss, :oauth,`
`GITHUB_CLIENT_ID: System.put_env("GITHUB_CLIENT_ID", "your client id number"),`
`GITHUB_CLIENT_SECRET: System.put_env("GITHUB_CLIENT_SECRET", "your client secret number")`

### To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Create and migrate your database with `mix ecto.setup`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
