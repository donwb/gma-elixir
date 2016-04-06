defmodule Gma.Controller do
    import Ecto.Query
    
    # Look at this code... look familiar (linq)?
	def get_all_homes do
	    
	    # where clause not necessary, here for example
		query = from h in Home,
		    where: h.id > 0,
		    order_by: [h.display_order],
			select: h
			
		Gma.Repo.all(query)
		
	end
	
	def get_meta do
		query = from m in Meta,
			select: m
			
		Gma.Repo.one(query)
	end
	
end
