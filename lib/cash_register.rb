require 'pry'

class CashRegister

  attr_accessor :total, :discount, :title, :price, :quantity, :item_total, :items

  def initialize (employee_discount=0)
    @total = 0
    @discount= employee_discount
    @items = []
  end

  def total
    @total
  end

  def items
    @items
  end

  def add_item(title,price, quantity = 1)
    @quantity = quantity
    @title = title
    @item_total = 0
    @item_total = price * quantity
    @total = @total + @item_total
    self.save_item(@title, @quantity)
  end

  def save_item(title,quantity)
    counter = quantity
    while counter > 0
      #binding.pry
      @items << title
      counter = counter - 1
    end
  end

  def apply_discount
    message = nil
    if @discount > 0
      @total = @total - (@total * (@discount.to_f/100))
      message = "After the discount, the total comes to $#{@total.to_i}."
    else
      message = "There is no discount to apply."
    end
    message
  end

  def void_last_transaction
    @total = 0
  end

end
