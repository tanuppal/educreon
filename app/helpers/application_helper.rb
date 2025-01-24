module ApplicationHelper
	def is_active_controller(controller_name, class_name = nil)
    if params[:controller] == controller_name
     class_name == nil ? "active" : class_name
    else
       nil
    end
  end
    
  def is_active_action(action_name)
    params[:action] == action_name ? "active" : nil
  end

  def total_date_count(r_date)
    rental_date = 0
    pickup_date = r_date.rental_picup
    return_date = r_date.rental_return
    rental_date += (return_date.to_date - pickup_date.to_date).to_i
    return rental_date
  end

  def rental_price(scheduling)
    rental_price = 0
    pickup_date = scheduling.rental_picup
    return_date = scheduling.rental_return
    date_count = (return_date.to_date - pickup_date.to_date).to_i
    weekly_price = scheduling.product.product_rental.weekly.to_i
    last_date_price = scheduling.product.product_rental.product_pricing_rents.last.price.to_i
    last_date_name = scheduling.product.product_rental.product_pricing_rents.last.name.to_i
    three_day_price = scheduling.product.product_rental.day3.to_i
    two_day_price = scheduling.product.product_rental.day2.to_i
    one_day_price = scheduling.product.product_rental.day1.to_i
    puts "---------------->> #{weekly_price}"

    if date_count > 4
      rate = ProductPricingRent.where("name=?",date_count).first
      if rate.present?
        rental_price = rate.price.to_f
      else
        puts "===>  #{last_date_price.to_f}  ---->   #{last_date_name.to_f}"
        rental_price_pay_day = (last_date_price.to_f / last_date_name.to_f).round(2)

        rental_price = (rental_price_pay_day * date_count).round(2)
      end
    # elsif date_count > 7 && date_count < 8
    #   rental_price_pay_day = (weekly_price.to_f / 7.to_f).round(2)
    #   puts "--------------->>  #{rental_price_pay_day}"
    #   rental_price = rental_price_pay_day * date_count
    elsif date_count >= 3 && date_count < 4
      rental_price_pay_day = (three_day_price.to_f / 3.to_f).round(2)
      rental_price = (rental_price_pay_day * date_count).round(2)
    elsif date_count >= 2 && date_count < 3 && date_count < 7
      rental_price_pay_day = (two_day_price.to_f / 2.to_f).round(2)
      rental_price = (rental_price_pay_day * date_count).round(2)
    elsif date_count >= 1 && date_count < 2 && date_count < 3 && date_count < 7
      rental_price_pay_day = (one_day_price.to_f / 1.to_f).round(2)
      rental_price = (rental_price_pay_day * date_count).round(2)
    end
   return rental_price
  end  

  def get_total_ammount(total)
    total_amount = 0
    t = total.product.product_pricing
      total_amount += t.price.to_i
    return  total_amount
  end

  def sales_tax_report(total,tax_persion)
    sales_tax = 0
    if total.present?
      sales_tax += (total*tax_persion)/100
    end
    return sales_tax
  end
end
