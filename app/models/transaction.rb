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

  # def current_month_
end
