use Mix.Config

config :elixir_tweet, ElixirTweet.Scheduler, jobs: [
    {"* * * *", fn ->
        ElixirTweet.FileReader.get_strings_to_tweet(
            Path.join("#{:code.priv_dir(:elixir_tweet)}", "sample.txt")
        )

        |> ElixirTweet.TweetServer.tweet
    end }
]