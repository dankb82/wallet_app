class Transaction < ActiveRecord::Base

  def self.balance
    credit = 0.0
    debit = 0.0
    self.all.each do |i|
      credit += i.amount if i.credit_or_debit == "credit"
      debit += i.amount if i.credit_or_debit == "debit"
    end
    credit - debit
  end

  def self.total_transactions
    self.count
  end

  def self.current_month_spending
     total_for_month = 0
     self.all.each do |i|
       if ((i.credit_or_debit == "debit") && (i.exchange_date.mon == Time.now.mon))
         total_for_month += i.amount
       end
     end
     total_for_month
   end
end
