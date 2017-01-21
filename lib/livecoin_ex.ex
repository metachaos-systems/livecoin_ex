defmodule LivecoinEx do
  @moduledoc """
  Livecoin api methods
  """
  use HTTPoison.Base

  def ticker(first, second) do
    first = String.upcase(first)
    second = String.upcase(second)
    "/exchange/ticker?currencyPair=#{first}/#{second}"
      |> get()
      |> extract_body()
  end

  defp process_url(url) do
    "https://api.livecoin.net" <> url
  end

  def extract_body(result) do
    with {:ok, response} <- result,
      body = response.body,
      do: {:ok, body},
      else: ({:error, reason} -> {:error, reason})
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
