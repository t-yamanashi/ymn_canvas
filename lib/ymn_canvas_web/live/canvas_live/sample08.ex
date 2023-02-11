defmodule YmnCanvasWeb.CanvasLive.Sample08 do
  use YmnCanvasWeb, :live_view
  import YmnCanvas.Draw

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 100)

    {:ok,
     socket
     |> assign(data: create_data())}
  end

  @impl true
  def handle_info(:update, socket) do
    Process.send_after(self(), :update, 130)

    {:noreply,
     socket
     |> assign(data: create_data())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <.live_component module={YmnCanvasWeb.CanvasComponent} id="test" data={@data} />
    """
  end

  def create_data() do
    h = Enum.random([55, 110, 220, 440, 880, 1760])

    [
      fill_style("#000000"),
      fill_rect(0, 0, 1024, 768),
      fill_style("#00FF00"),
      fill_rect(h * 0.5, 500, 50, 200),
      font("200px serif"),
      fill_text(h, 200, 300),
      font("100px serif"),
      fill_text("Hz", 700, 300),
      oscillator(:square, h, 0.2)
    ]
  end
end
