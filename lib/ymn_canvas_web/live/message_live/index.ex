defmodule YmnCanvasWeb.MessageLive.Index do
  use YmnCanvasWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 100)

    {:ok,
     socket
     |> assign(data: create_data())
    }
  end

  @impl true
  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 100)

    {:noreply,
     socket
     |> assign(data: create_data())
    }
  end

  defp create_data() do
    %{
      x: Enum.random(10..300),
      y: Enum.random(10..300)
    }
  end
end
