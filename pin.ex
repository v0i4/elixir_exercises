defmodule Greeter do
	def for(name, greeting) do 
	fn
	(^name) -> "Hello #{name}"
	(_) -> "dont know you"
	end
	end
end
