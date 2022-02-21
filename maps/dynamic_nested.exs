
nested = %{
buttercup: %{
actor: %{
first: "Robin",
last: "Wright"
},
role: "princess"
},
westley: %{
actor: %{
first: "Cary",
last: "Elwes"
},
role: "farm boy"
}
}
# typo!
IO.inspect get_in(nested, [:buttercup])
# => %{actor: %{first: "Robin", last: "Wright"}, role: "princess"}
IO.inspect get_in(nested, [:buttercup, :actor])
# => %{first: "Robin", last: "Wright"}
IO.inspect get_in(nested, [:buttercup, :actor, :first])
# => "Robin"
IO.inspect put_in(nested, [:westley, :actor, :last], "Elwes")
# => %{buttercup: %{actor: %{first: "Robin", last: "Wright"}, role: "princess"},
# =>
 westley: %{actor: %{first: "Cary", last: "Elwes"}, role: "farm boy"}}
