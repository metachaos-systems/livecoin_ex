defmodule LivecoinTest do
  use ExUnit.Case
  doctest Livecoin

  test "get coin info for BTC" do
    {:ok, result} = Livecoin.coin_info()
    assert [%{"minDepositAmount" => _, "name" => _} | _] = result
  end

  test "get all order books" do
    {:ok, result} = Livecoin.all_order_book()
    {currency_pair, order_book_data} = result |> Enum.to_list |> hd()
    assert %{"timestamp" => _, "asks" => _, "bids" => _} = order_book_data
  end

  test "get order book" do
    assert {:ok,  %{"timestamp" => _, "asks" => _, "bids" => _}  } = Livecoin.order_book("btc","usd" )
  end

  test "get last trades" do
    assert {:ok,  [%{ "time" => _, "id" => _, "price" => _, "quantity" => _, "type" => _ } | _ ]} = Livecoin.last_trades("btc","usd" )
  end

  test "get ticker for all pairs" do
    assert {:ok,  [%{"best_ask" => _, "best_bid" => _, "vwap" => _} | _ ]} = Livecoin.ticker()
  end

  test "get ticker for BTC/USD pair" do
    assert {:ok, %{"best_ask" => _, "best_bid" => _, "vwap" => _}} = Livecoin.ticker("btc","usd")
  end
end
