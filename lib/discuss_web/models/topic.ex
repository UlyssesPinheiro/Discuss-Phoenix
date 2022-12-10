defmodule Discuss.Topic do
  use DiscussWeb, :model
  # use Ecto.Schema

  schema "topics" do
    field :title, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
