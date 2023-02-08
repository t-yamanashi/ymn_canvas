defmodule YmnCanvasWeb.CanvasLive.Sample03 do
  use YmnCanvasWeb, :live_view
  import YmnCanvas.Draw

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 25)

    {:ok, socket |> assign(data: []) |> assign(character: %{}) }
  end

  @impl true
  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 25)


    {:noreply,
     socket
     |> assign(character: crate_character(socket.assigns.character))
     |> assign(data: create_data(socket.assigns.character))}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.live_component module={YmnCanvasWeb.CanvasComponent} id="test" data={@data} />
    """
  end

  def crate_character(character) do
    fx = Map.get(character, :fx, -10)
    fy = Map.get(character, :fy, 10)
    x = Map.get(character, :x, 10) + fx
    y = Map.get(character, :y, 10) + fy
    fx = if x > 1000, do: -1 * fx, else: fx
    fy = if y > 743, do: -1 * fy, else: fy
    fx = if x < 0, do: -1 * fx , else: fx
    fy = if y < 0, do: -1 * fy, else: fy

    %{x: x, y: y, fx: fx, fy: fy}
  end

  def create_data(character) do
    now = DateTime.utc_now()
    IO.inspect(character[:x])
    [
      fill_style("#000000"),
      fill_rect(0, 0, 1024, 768),
      fill_style("#00FF00"),
      fill_rect(character[:x], character[:y], 50, 50),
      font("48px serif"),
      fill_style("#00AA00"),
      fill_text(now, 180, 400)
    ]
  end
end
