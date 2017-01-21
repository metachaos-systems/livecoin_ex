# Livecoin

Elixir client for Livecoin API.  

The following functions are available:

* `coin_info()`
* `ticker()`
* `ticker("TOKEN1","TOKEN2")`
* `order_book("TOKEN1", "TOKEN2")`
* `all_order_book()`
* `last_trades("TOKEN1", "TOKEN2")`

Example responses are provided for every function in the docs.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `livecoin_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:livecoin_ex, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/livecoin_ex](https://hexdocs.pm/livecoin_ex).
