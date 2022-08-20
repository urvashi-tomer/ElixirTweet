defmodule ElixirTweet.FileReader do
    @doc """
    This function will take the path to a file and find a string that can be tweeted out.
    It will trim all the strings, and then eliminate any strings that are larger than 140 characters.

    iex> ElixirTweet.FileReader.get_strings_to_tweet("priv/test/too_long.txt")
    "Short line"
    """
    def get_strings_to_tweet(path) do
        File.read!(path)
        |> pick_string
    end

    def pick_string(str) do
        str
        |> String.split("\r\n")
        |> Enum.map(&String.trim/1)
        |> Enum.filter(&String.length(&1) <= 140)
        |> Enum.random()
    end
end