defmodule ElixirDiscovery.IndexHandler do
  def init(request, options) do
    headers = [{"content-type", "text/plain"}]
    body = """
      api/
      api/characters/[:string]
      api/words/[:string]
    """
    cowboy_request = :cowboy_req.reply(404, headers, body, request)
    {:ok, cowboy_request, options}
  end
end