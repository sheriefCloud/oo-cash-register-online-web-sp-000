require 'pry'

class CashRegister

  attr_accessor :total, :discount, :title, :price, :quantity, :item_total, :items

  @items = []

  def initialize (employee_discount=0)

    @total = 0
    @discount= employee_discount

  end

  def total
    @total
  end


  def items
    @items
  end

  def add_item(title,price, quantity = 1)
    @item_total = 0
    @item_total = price * quantity
    @total = @total + @item_total
    binding.pry
    self.save_item(title, quantity)
  end

  def save_item(title, quantity)
    counter = @quantity
    while counter > 0
      @items << title
      counter = counter - 1
    end
  end

  def apply_discount
    message = nil
    if @discount > 0
      @total = @total - (@total.to_f * (@discount.to_f/100))
      message = "After the discount, the total comes to $#{@total.to_i}."
    else
      message = "There is no discount to apply."
    end
    message
  end



end
