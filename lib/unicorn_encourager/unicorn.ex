defmodule UnicornEncourager.Frame do
  alias UnicornEncourager.Frame

  require Logger

  @unicorn_size 32

  defstruct pixels: (for _ <- 1..@unicorn_size, do: {0,0,0})

  def shift(frame = %Frame{}, pixels) do
    %Frame{pixels: Enum.drop(frame.pixels, length(pixels)) ++ pixels}
  end
end

defmodule UnicornEncourager.Unicorn do
  alias Nerves.Neopixel
  alias UnicornEncourager.Frame

  require Logger

  def start_link do
    Neopixel.start_link([pin: 18, count: 32])
  end

  @channel 0
  def render(intensity, frame = %Frame{}) do
    Neopixel.render(@channel, {intensity, frame.pixels})
  end

  def scroll(intensity, rows, speed \\ 250) do
    initial_frame = %Frame{pixels: List.flatten(Enum.take(rows, 4))}

    rows
    |> Enum.drop(4)
    |> Enum.reduce([initial_frame], fn(row, frames = [head | _]) -> [ Frame.shift(head, row) | frames] end)
    |> Enum.reverse()
    |> Enum.each(fn(frame) ->
      render(intensity, frame)
      :timer.sleep(speed)
    end)
  end
end
