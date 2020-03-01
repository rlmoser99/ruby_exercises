def stock_picker prices
    # variables needed to solve
    highest_profit = 0
    best_day_to_buy = 0
    best_day_to_sell = 0
    # loop through each price
    prices.each do |price|
        current_day = prices.index(price)
        # compare each current price to future prices
        future_prices = prices[current_day + 1..-1]
        future_prices.each do |future_price|
            possible_profit = future_price - price
            future_days = future_prices.index(future_price) + 1
            # re-write variables when the profit is higher
            if possible_profit > highest_profit
                highest_profit = possible_profit
                best_day_to_buy = current_day
                best_day_to_sell = best_day_to_buy + future_days
            end
        end
    end
    print [best_day_to_buy, best_day_to_sell]
end

puts stock_picker([17,3,6,9,15,8,6,1,10])