module ProductsHelper
    def display_price(price=0)
        number_to_currency(price, precision: 2) 
    end
end
