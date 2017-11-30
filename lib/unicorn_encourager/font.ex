defmodule UnicornEncourager.Font do
  require Logger

  @characters %{
    "2" => [" XX    X",
            " X X   X",
            " X  X  X",
            " X  X  X",
            " X   XX "],

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

    "," => ["X       ",
            "XX      "],

    "'" => ["     XXX"],

    "-" => ["    X   ",
            "    X   ",
            "    X   "],

    "🐶" => ["  XX    ",
             "  XXXX  ",
             "   XXXX ",
             " XXXXXX ",
             "X      X",
             "        ",
             " X   XX ",
             "X  X    ",
             " XXX    ",
             "X  X    ",
             " X   XX ",
             "        ",
             " XXXXXX ",
             "   XXXX ",
             "  XXXX  ",
             "  XX    "],

    "{" => ["  X     ",
            "  XX    ",
            "  XXXX  ",
            "XXX  XXX",
            "X      X"],

    ")" => ["X      X",
            "XXX  XXX",
            "  XXXX  "],

    "❤️" => ["    XXX ",
            "  XXXXXX",
            " XXXXXXX",
            "XXXXXXX ",
            " XXXXXXX",
            "  XXXXXX",
            "    XXX "]
  }

  def string_to_pixels(string, color \\ {0xFF, 0xFF, 0xFF}) do
    string
    |> String.graphemes()
    |> Enum.map(fn(letter) -> letter_to_pixels(letter, color) end)
    |> Enum.intersperse(space())
    |> Enum.reduce([], fn(letter, acc) -> Kernel.++(acc, letter) end)
  end

  def letter_to_pixels(letter, color) do
    case @characters[letter] do
      nil ->
        Logger.error "#{letter} not found"
        nil
      rows -> Enum.map(rows, fn(row) -> row_to_pixels(row, color) end)
    end
  end

  defp row_to_pixels(row, color) do
    row
    |> String.graphemes()
    |> Enum.map(fn(grapheme) -> grapheme_to_pixel(grapheme, color) end)
  end

  defp grapheme_to_pixel(" ", _), do: {0,0,0}
  defp grapheme_to_pixel(_, color), do: color

  defp space do
    [
      [{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0},{0,0,0}]
    ]
  end
end
