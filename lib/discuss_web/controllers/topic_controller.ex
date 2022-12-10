defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic

  def new(conn, params) do
    struct = %Topic{}
    params = %{}
    changeset = Topic.changeset(struct, params)

    render conn, "new.html", changeset: changeset
  end

  def create(conn, params) do
    %{"topic" => topic} = params

    changeset = Topic.changeset(%Topic{}, topic)

    Repo.insert(changeset)
  end
end
