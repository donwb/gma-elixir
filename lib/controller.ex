defmodule Gma.Controller do
    import Ecto.Query
    
	def test_query do
	
		query = from h in Home,
			select: h
			
		res =Gma.Repo.all(query)
		
	end
end
