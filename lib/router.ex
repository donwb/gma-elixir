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
        # send_resp(conn, 200, "I'm alive")
        send_file(conn, 200, "priv/static/index.html")
    end
    
    get "/about" do
        send_file(conn, 200, "priv/static/about.html")
    end
    
    get "/contact" do
        send_file(conn, 200, "priv/static/contact.html")
    end
    
    get "/testimonials" do
        send_file(conn, 200, "priv/static/testimonials.html")
    end
    
    
    get "/homes" do
    
        j = Gma.Controller.get_all_homes
        |>Poison.encode!
        
        conn
        |>put_resp_content_type("application/json")
        |>send_resp(200, j)
        
    end
    
    get "/data" do
    
        j = Gma.Controller.get_meta
        |>Poison.encode!
        
        conn
        |>put_resp_content_type("application/json")
        |>send_resp(200, j)
    end

    match _ do
        conn
        |> send_resp(404, "404'd")
        |> halt
    end
end
