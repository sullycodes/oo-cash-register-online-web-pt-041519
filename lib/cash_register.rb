class CashRegister

  attr_accessor :total
  
  def initialize(discount = 0)
    @total = 0 
    @discount = discount
    @items = []
  end
  
  def discount
    @discount
  end
  
  def add_item(title, price, quantity = 1)
    prev_total = @total
    @total += price * quantity
      quantity.times do 
        @items << title
      end
    @last_price = price
  end
  
  def apply_discount
    if @discount > 0
      d = @discount.to_f / 100
      @total * d
      @total = @total * (1-d)
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    @items
  end
  
  def void_last_transaction
    @total = @total - @last_price
  end

end #CashRegister

cash = CashRegister.new(10)
cash.add_item("cereal", 5.00)
cash.add_item("cheese", 3.00)
cash.add_item("bread", 4.00, 3)
# p cash.items
cash.add_item("milk", 1.45)
puts cash.total
puts cash.void_last_transaction
puts cash.apply_discount


