defmodule Gma.Router do
    use Plug.Router
    use Plug.Builder
    
    if Mix.env == :dev do
        IO.puts("debug environment")
        use Plug.Debugger
    end
    
    plug Plug.Static, at: "/public", from: :gma
    
    plug :match
    plug :dispatch
    
    get "/" do
        send_resp(conn, 200, "I'm alive")
    end

    match _ do
        conn
        |> send_resp(404, "404'd")
        |> halt
    end
end
