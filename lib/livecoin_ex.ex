defmodule LivecoinEx do
  @moduledoc """
  Livecoin api methods
  """
  use HTTPoison.Base

  def process_url(url) do
    "https://api.livecoin.com" <> url
  end

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

end
