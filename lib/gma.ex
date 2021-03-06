defmodule Gma do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      # Define workers and child supervisors to be supervised
      # worker(Gma.Worker, [arg1, arg2, arg3]),
      # tree = [supervisor(PgTest.Repo, [])]
      
        
      worker(__MODULE__, [], function: :run),
      supervisor(Gma.Repo, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    # opts = [name: PgTest.Sup, strategy: :one_for_one]
    opts = [strategy: :one_for_one, name: Gma.Supervisor]
    Supervisor.start_link(children, opts)
  end
  
  def run do
    p = System.get_env("PORT")
    
    {port, _} = 
      case p do
        nil -> {3000, nil}
        _ -> Integer.parse(p)
      end
      
    IO.puts("port: #{port}" )
    
    {:ok, _} = Plug.Adapters.Cowboy.http Gma.Router, [], [port: port]
    
  end
  
end
