defmodule ElixirDiscovery.WordHandler do
  def init(request, options) do
    if (:cowboy_req.method(request) == "GET") do
      name = :cowboy_req.binding(:words, request, "")
      headers = [{"content-type", "text/plain"}]
      body = "You have entered #{String.split(name) |> length}"
      response = :cowboy_req.reply(200, headers, body, request)
      {:ok, response, options}
    else
      ElixirDiscovery.IndexHandler.init(request, options)
    end
  end
end