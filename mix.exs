defmodule LivecoinEx.Mixfile do
  use Mix.Project

  def project do
    [app: :livecoin_ex,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, ">= 0.0.0"},
      {:poison, "~> 2.0.0"}
    ]
  end

  defp description do
    """
    livecoin.net API client for Elixir/Erlang.
    Provides access to ticker and trading data for cryptocurrency pairs
    """
  end

  defp package do
    [# These are the default files included in the package
     files: ["lib", "mix.exs", "README*", "LICENSE*"],
     maintainers: ["ontofractal"],
     licenses: ["MIT"],
     links: %{"GitHub" => "https://github.com/cyberpunk-ventures/livecoin_ex"}]
   end

end
