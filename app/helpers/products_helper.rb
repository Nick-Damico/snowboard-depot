module ProductsHelper
    def display_price(price=0)
        number_to_currency(price, precision: 2) 
    end

    def display_description(description, truncate=false, length=100)
        desc = strip_tags(description)
        truncate ? truncate(desc, length: length) : desc
    end
end
