# credo:disable-for-this-file
defmodule K8s.Test.HTTPHelper do
  @moduledoc "HTTP Helpers for test suite."

  def render(data), do: render(data, 200)
  def render(data, code), do: render(data, code, [])

  def render(data, code, headers) when is_list(data) do
    data
    |> Enum.into(%{})
    |> render(code, headers)
  end

  def render(data, code, headers) do
    body = Jason.encode!(data)
    {:ok, %HTTPoison.Response{status_code: code, body: body, headers: headers}}
  end
end
