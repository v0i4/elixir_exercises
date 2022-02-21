prefix = fn first_str -> (fn second_str -> "#{first_str} #{second_str}" end) end

times_2 = fn val -> val*2 end

apply  = fn (fun, val) -> fun.(val) end

