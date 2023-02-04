defmodule YmnCanvas.Messages.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
