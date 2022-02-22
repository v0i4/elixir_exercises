defmodule Taxes do

 def run do
 tax_rates = [NC: 0.075, TX: 0.08]

    orders = [
      [id: 123, ship_to: :NC, net_amount: 100.00],
      [id: 124, ship_to: :OK, net_amount: 35.00],
      [id: 125, ship_to: :TX, net_amount: 24.00],
      [id: 126, ship_to: :TX, net_amount: 44.00],
      [id: 127, ship_to: :NC, net_amount: 25.00],
      [id: 128, ship_to: :MA, net_amount: 10.00],
      [id: 129, ship_to: :CA, net_amount: 102.00],
      [id: 130, ship_to: :NC, net_amount: 50.00]
    ]
  totalAmount(orders, tax_rates)
 end

 def applyTax(order = [id: _, ship_to: state, net_amount: net], tax_rates ) do

  if Keyword.get(tax_rates, state) != nil do
    Keyword.put(order, :taxed_value, net * tax_rates[state] + net)
    else
     Keyword.put(order, :taxed_value, net)

  end
end

  def totalAmount(orders, tax_rates) do
    orders |> Enum.map(fn order -> applyTax(order, tax_rates) end)

  end
end

IO.inspect Taxes.run()
