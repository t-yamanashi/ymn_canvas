defmodule YmnCanvasWeb.CanvasLive.Sample02 do
  use YmnCanvasWeb, :live_view
  import YmnCanvas.Draw

  @impl true
  def mount(_params, _session, socket) do
    Process.send_after(self(), :update, 25)

    {:ok,
     socket
     |> assign(data: create_data())}
  end

  @impl true
  def handle_info(:update, socket) do
    {:noreply,
     socket
     |> assign(data: create_data())}
  end

  @impl true
  def render(assigns) do
    ~H"""
    <img id="testimg" src="/images/phoenix.png" style="display:none"/>
    <.live_component module={YmnCanvasWeb.CanvasComponent} id="test" data={@data} />
    """
  end

  def create_data() do
    [
      fill_style("#000000"),
      fill_rect(0, 0, 1024, 768),
      draw_image("#testimg", 10, 100),
      font("48px serif"),
      fill_style("#00FF00"),
      fill_text(DateTime.utc_now, 10, 300)
    ]
  end
end
