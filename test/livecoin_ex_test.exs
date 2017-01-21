defmodule LivecoinExTest do
  use ExUnit.Case
  doctest LivecoinEx

  test "get all order books" do
    {:ok, result} = LivecoinEx.all_order_book()
    {currency_pair, order_book_data} = result |> Enum.to_list |> hd() 
    assert %{"timestamp" => _, "asks" => _, "bids" => _} = order_book_data
  end

  test "get order book" do
    assert {:ok,  %{"timestamp" => _, "asks" => _, "bids" => _}  } = LivecoinEx.order_book("btc","usd" )
  end

  test "get last trades" do
    assert {:ok,  [%{ "time" => _, "id" => _, "price" => _, "quantity" => _, "type" => _ } | _ ]} = LivecoinEx.last_trades("btc","usd" )
  end

  test "get ticker for all pairs" do
    assert {:ok,  [%{"best_ask" => _, "best_bid" => _, "vwap" => _} | _ ]} = LivecoinEx.ticker()
  end

  test "get ticker for BTC/USD pair" do
    assert {:ok, %{"best_ask" => _, "best_bid" => _, "vwap" => _}} = LivecoinEx.ticker("btc","usd")
  end
end
