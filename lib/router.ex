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
    
    get "/data" do
        # Gawd fix this!  carry-over from old site
        json = """
        {
          "title":"Traci Browning, REALTOR",
          "tag-line":"Specializing in West Cobb, East Cobb, and North Atlanta",
          "footer":"Copyright Good Move Atlanta 2016"
        }
        """
        conn
        |>put_resp_content_type("application/json")
        |>send_resp(200, json)
    end
    
    get "/homes" do
    
        j = Gma.Controller.test_query
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
