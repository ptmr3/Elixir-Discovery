defmodule ElixirDiscovery.CharacterHandler do
  def init(request, options) do
    if (:cowboy_req.method(request) == "GET") do
      name = :cowboy_req.binding(:characters, request, "")
      headers = [{"content-type", "text/plain"}]
      body = "You have entered #{String.length(name)} characters"
      response = :cowboy_req.reply(200, headers, body, request)
      {:ok, response, options}
    else
      ElixirDiscovery.IndexHandler.init(request, options)
    end
  end
end