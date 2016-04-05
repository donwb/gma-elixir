defmodule Gma.Controller do
    import Ecto.Query
    
    # Look at this code... look familiar (linq)?
	def test_query do
	    
	    # where clause not necessary, here for example
		query = from h in Home,
		    where: h.id > 0,
		    order_by: [h.display_order],
			select: h
			
		Gma.Repo.all(query)
		
	end
end
