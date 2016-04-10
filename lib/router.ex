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
        idx = Path.join("#{:code.priv_dir(:gma)}", "static/index.html")
        send_file(conn, 200, idx)
    end
    
    get "/about" do
        abt = Path.join("#{:code.priv_dir(:gma)}", "static/about.html")
        send_file(conn, 200, abt)
    end
    
    get "/contact" do
        cts = Path.join("#{:code.priv_dir(:gma)}", "static/contact.html")
        send_file(conn, 200, cts)
    end
    
    get "/testimonials" do
        test = Path.join("#{:code.priv_dir(:gma)}", "static/testimonials.html")
        send_file(conn, 200, test)
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
