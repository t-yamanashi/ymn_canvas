defmodule YmnCanvasWeb.PageController do
  use YmnCanvasWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
