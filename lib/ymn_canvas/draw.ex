defmodule YmnCanvas.Draw do
  @doc """
  四角で塗りつぶす
  """
  def fill_rect(x, y, w, h), do: ["fillRect", x, y, w, h]

  @doc """
  塗りつぶす色を指定する
  """
  def fill_style(style), do: [:fillStyle, style]
  def stroke_style(style), do: [:strokeStyle, style]
  def begin_path(), do: [:beginPath]
  def stroke(), do: [:stroke]
  def arc(x, y, radius, start_angle, end_angle), do: [:arc, x, y, radius, start_angle, end_angle]
  def move_to(x, y), do: [:moveTo, x, y]
  def line_to(x, y), do: [:lineTo, x, y]
end
