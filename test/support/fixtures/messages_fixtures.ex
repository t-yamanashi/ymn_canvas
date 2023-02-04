defmodule YmnCanvas.MessagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `YmnCanvas.Messages` context.
  """

  @doc """
  Generate a message.
  """
  def message_fixture(attrs \\ %{}) do
    {:ok, message} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> YmnCanvas.Messages.create_message()

    message
  end
end
