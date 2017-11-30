defmodule UnicornEncourager.Font do
  @characters %{
    "A" => [" XXXXXX ",
            "   X   X",
            "   X   X",
            " XXXXXX "],

    "B" => [" XXXXXXX",
            " X  X  X",
            " X  X  X",
            "  XX XX "],

    "C" => ["  XXXXX ",
            " X     X",
            " X     X",
            " X    XX"],

    "D" => [" XXXXXXX",
            " X     X",
            " X     X",
            "  XXXXX "],

    "E" => [" XXXXXXX",
            " X  X  X",
            " X  X  X",
            " X     X"],

    "F" => [" XXXXXXX",
            "    X  X",
            "    X  X",
            "       X"],

    "G" => ["  XXXXX ",
            " X     X",
            " X X   X",
            "  XX   X"],

    "H" => [" XXXXXXX",
            "    X   ",
            "    X   ",
            " XXXXXXX"],

    "I" => [" X     X",
            " XXXXXXX",
            " X     X"],

    "J" => ["  XX    ",
            " X     X",
            " X     X",
            "  XXXXXX"],

    "K" => [" XXXXXXX",
            "    X   ",
            "   X X  ",
            " XX   XX"],

    "L" => [" XXXXXXX",
            " X      ",
            " X      ",
            " X      "],

    "M" => [" XXXXXXX",
            "     XX ",
            "   XX   ",
            "     XX ",
            " XXXXXXX"],

    "N" => [" XXXXXXX",
            "     XX ",
            "   XX   ",
            " XXXXXXX"],

    "O" => ["  XXXXX ",
            " X     X",
            " X     X",
            "  xxxxx "],

    "P" => [" XXXXXXX",
            "    X  X",
            "    X  X",
            "     XX "],

    "Q" => ["  XXXXX ",
            " X     X",
            "XX     X",
            "X XXXXX "],

    "R" => [" XXXXXXX",
            "   XX  X",
            "  X X  X",
            " X   XX "],

    "S" => [" X   XX ",
            " X  X  X",
            " X  X  X",
            "  XX   X"],

    "T" => ["       X",
            " XXXXXXX",
            "       X"],

    "U" => ["  XXXXXX",
            " X      ",
            " X      ",
            "  XXXXXX"],

    "V" => ["   XXXXX",
            "  X     ",
            " X      ",
            "  X     ",
            "   XXXXX"],

    "W" => [" XXXXXXX",
            "  XX    ",
            "    XX  ",
            "  XX    ",
            " XXXXXXX"],

    "X" => [" XX   XX",
            "   X X  ",
            "    X   ",
            "   X X  ",
            " XX   XX"],

    "Y" => ["     XXX",
            " XXXX   ",
            "     XXX"],

    "Z" => [" XX    X",
            " X XX  X",
            " X  XX X",
            " X    XX"],

    " " => ["        ",
            "        ",
            "        ",
            "        "],

    "!" => ["XX XXXXX"],

    "?" => ["       X",
            "XX X   X",
            "    X  X",
            "     XX "],

    "." => ["XX      "],

    "'" => ["     XXX"],
  }

  def string_to_pixels(string) do
    string
    |> String.graphemes()
    |> Enum.map(&letter_to_pixels/1)
    |> Enum.intersperse(space())
    |> Enum.reduce([], fn(letter, acc) -> Kernel.++(acc, letter) end)
  end

  def letter_to_pixels(letter) do
    @characters[letter]
    |> Enum.map(&row_to_pixels/1)
  end

  defp row_to_pixels(row) do
    row
    |> String.graphemes()
    |> Enum.map(&grapheme_to_pixel/1)
  end

  defp grapheme_to_pixel(" "), do: {0,0,0}
  defp grapheme_to_pixel(_), do: {255, 255, 255}

  defp space do
    [
      [{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}],
      [{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}]
    ]
  end
end
