defmodule ElixirDiscovery.BenchmarkHandler do
  def init(request, options) do
    if (:cowboy_req.method(request) == "GET") do
      headers = [{"content-type", "text/plain"}]
      name = :cowboy_req.binding(:loops, request)
      loops = String.to_integer(name)
      start_time = :os.system_time(:millisecond)
      Enum.each(0..loops, fn(x) ->
        IO.puts "#{:os.system_time(:millisecond)}"
      end)
      body = "#{loops} loops completed in #{(:os.system_time(:millisecond)) - start_time} milliseconds"
      response = :cowboy_req.reply(200, headers, body, request)
      {:ok, response, options}
    else
      ElixirDiscovery.IndexHandler.init(request, options)
    end
  end
end