defmodule YmnCanvas.Repo do
  use Ecto.Repo,
    otp_app: :ymn_canvas,
    adapter: Ecto.Adapters.SQLite3
end
