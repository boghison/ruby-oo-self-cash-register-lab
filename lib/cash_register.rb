class CashRegister
    attr_reader :discount, :items
    attr_accessor :total

    def initialize(discount = 0)
        @discount = discount
        @items = []
        @total = 0
    end

    def add_item(name, price, q = 1)
        q.times {@items << name}
        @total += price * q
        @last_transaction = {:name => name, :price => price, :q => q}
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            @total -= @discount * total/100
            "After the discount, the total comes to $#{@total}."
        end
    end

    def void_last_transaction
        items.pop
        @total -= @last_transaction[:price] * @last_transaction[:q]
    end
end