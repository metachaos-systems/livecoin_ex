defmodule LivecoinExTest do
  use ExUnit.Case
  doctest LivecoinEx

  test "get all order books" do
    assert {:ok,  [%{"timestamp" => _, "asks" => _, "bids" => _} | _ ]  } = LivecoinEx.all_order_book("btc","usd" )
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
