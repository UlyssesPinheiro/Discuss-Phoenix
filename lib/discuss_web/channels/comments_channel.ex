defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel
  alias Discuss.Topic
  alias Discuss.Repo

  def join(name, _params, socket) do
    "comments:" <> topic_id = name
    topic_id = String.to_integer(topic_id)
    topic = Repo.get(Topic, topic_id)

    {:ok, %{}, socket}
  end

  def handle_in(name, message, socket) do
    {:reply, :ok, socket}
  end
end
