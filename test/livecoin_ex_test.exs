defmodule LivecoinExTest do
  use ExUnit.Case
  doctest LivecoinEx

  test "last trades" do
    assert {:ok,  [%{ "time": _, "id": _, "price": _, "quantity": _, "type": "BUY" } | _ ]} = LivecoinEx.last_trades()
  end

  test "ticker for all pairs" do
    assert {:ok,  [%{"best_ask" => _, "best_bid" => _, "vwap" => _} | _ ]} = LivecoinEx.ticker()
  end

  test "ticker for BTC/USD pair" do
    assert {:ok, %{"best_ask" => _, "best_bid" => _, "vwap" => _}} = LivecoinEx.ticker("btc","usd")
  end
end
