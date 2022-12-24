defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel
  alias Discuss.{Topic, Repo}
  alias DiscussWeb.Comment


  def join(name, _params, socket) do
    "comments:" <> topic_id = name
    topic_id = String.to_integer(topic_id)
    topic = Repo.get(Topic, topic_id)

    {:ok, %{}, assign(socket, :topic, topic)}
  end

  def handle_in(name, message, socket) do
    %{"content" => content} = message

    topic = socket.assigns.topic

    changeset = topic
    |> Ecto.build_assoc(:comments)
    |> Comment.changeset(%{content: content})

    case Repo.insert(changeset) do
      {:ok, comment} ->
        {:reply, :ok, socket}

      {:error, _reason} ->
        {:reply, {:error, %{errors: changeset}}, socket}
    end

    {:reply, :ok, socket}
  end
end
