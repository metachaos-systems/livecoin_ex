defmodule LivecoinEx do
  @moduledoc """
  Livecoin api methods
  """
  use HTTPoison.Base

  @doc """
  Coin info example response
   [
      {
          "name": "MaidSafeCoin",
          "symbol": "MAID",
          "walletStatus": "down",
          "withdrawFee": 2,
          "minDepositAmount": 10,
          "minWithdrawAmount": 1,
          "minOrderAmount": 1
      },
      {
          "name": "Bitcoin",
          "symbol": "BTC",
          "walletStatus": "down",
          "withdrawFee": 0.0004,
          "minDepositAmount": 0,
          "minWithdrawAmount": 0.002,
          "minOrderAmount": 0.01
      }
  ]
  """
  def coin_info() do
    "/info/coinInfo"
      |> get_and_extract()
  end

  @doc """
  Ticker response example
  %{ cur: "BTC",
    symbol: "BTC/EUR",
    last: 830.64858,
    high: 869.99,
    low: 787.4596,
    volume: 166.93894877,
    vwap: 825.99029209,
    max_bid: 869.99,
    min_ask: 51,
    best_bid: 807.148,
    best_ask: 850 }
  """
  def ticker() do
    "/exchange/ticker"
      |> get_and_extract()
  end

  def ticker(first, second) do
    pair = create_currency_pair(first,second)
    "/exchange/ticker?currencyPair=#{pair}"
      |> get_and_extract()
  end

  @doc """
  Last trades response example
  [
    {
        "time": 1409935047,
        "id": 99451,
        "price": 350,
        "quantity": 2.85714285,
        "type": "BUY"
    },
    {
        "time": 1409934792,
        "id": 99450,
        "price": 350,
        "quantity": 0.57142857,
        "type": "SELL"
    }
]

  """
  def last_trades(first, second, opts \\ []) do
    pair = create_currency_pair(first,second)
    "/exchange/last_trades?currencyPair=#{pair}"
      |> get_and_extract()
  end

  @doc """
  Order book response example
  {
    "timestamp": 1409921408869,
    "asks": [
        [
            "400.00000000",
            "5.00000000"
        ],
        [
            "500.00000000",
            "7.00000000"
        ]
    ],
    "bids": [
        [
            "350.00000000",
            "0.57142858"
        ],
        [
            "300.00000000",
            "5.00000000"
        ]
    ]
  }
  """
  def order_book(first, second, opts \\ []) do
    pair = create_currency_pair(first,second)
    "/exchange/order_book?currencyPair=#{pair}"
      |> get_and_extract()
  end


  @doc """
  Get all order book example response
  {
      "LTC/BTC": {
          "timestamp": 1441877692694,
          "asks": [
              [
                  "0.01240280",
                  "1018.43939000"
              ]
          ],
          "bids": [
              [
                  "0.01210890",
                  "247.07000000"
              ],
              [
                  "0.01210000",
                  "944.49586780"
              ]
          ]
      },
      "BTC/USD": [...],
      ...
  """
  def all_order_book(opts \\ []) do
    "/exchange/all/order_book"
      |> get_and_extract()
  end

  defp create_currency_pair(first, second) do
    String.upcase(first)  <> "/" <> String.upcase(second)
  end

  defp get_and_extract(url) do
    url
      |> get()
      |> extract_body()
  end

  defp process_url(url) do
    "https://api.livecoin.net" <> url
  end

  def extract_body(result) do
    with {:ok, response} <- result,
      body = response.body,
      do: unwrap_livecoin_success(body),
      else: ({:error, reason} -> {:error, reason})
  end

  defp unwrap_livecoin_success(body) do
    case body do
      %{"success" => true, "info" => payload} -> {:ok, payload}
      %{"success" => false, "error" => error} -> {:error, error}
      payload -> {:ok, payload}
    end
  end

  defp process_request_body(body), do: body

  defp process_response_body(body) do
    body
    |> Poison.decode!
  end

  defp process_request_headers(headers) when is_map(headers) do
    Enum.into(headers, [])
  end

  defp process_request_headers(headers), do: headers

  defp process_response_chunk(chunk), do: chunk

  defp process_headers(headers), do: headers

  defp process_status_code(status_code), do: status_code

end
