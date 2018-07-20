defmodule ElixirDiscovery do
  require Logger
  use Application

  def start(_type, _args) do
    port = Application.get_env(:elixir_discovery, :port)
    path_list = [
      {"/api/characters/[:characters]", ElixirDiscovery.CharacterHandler, []},
      {"/api/benchmark/[:loops]", ElixirDiscovery.BenchmarkHandler, []},
      {"/api/words/[:words]", ElixirDiscovery.WordHandler, []},
      {"/api/[...]", ElixirDiscovery.IndexHandler, []},
    ]
    routes = [{:_, path_list}]
    dispatch = :cowboy_router.compile(routes)
    opts = [port: port]
    env = [dispatch: dispatch]
    onresponse = fn (status, _headers, _body, request) ->
      method = :cowboy_req.method(request)
      path = :cowboy_req.path(request)
      Logger.info("#{method} #{path} - #{status}")
      request
    end
    :cowboy.start_http(:http, 100, opts, [env: env, onresponse: onresponse])  end
end
