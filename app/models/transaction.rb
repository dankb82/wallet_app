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

  def self.transactions_for_month
    total = self.all.select {|i| i.exchange_date.mon == Time.now.mon}
    total.length
  end

  def self.transactions_last_month
    total = self.all.select {|i| (i.exchange_date.mon) == (Time.now.mon-1)}
    total.length
  end

  def self.biggest_expense_current
    expenses = []
    self.all.each do |i|
      if ((i.credit_or_debit == "debit") && (i.exchange_date.mon == Time.now.mon))
        expenses << i.amount
      end
    end
    expenses.max
  end

  def self.biggest_expense_ever
    all_expenses = []
    self.all.each do |i|
      all_expenses << i.amount if i.credit_or_debit == "debit"
    end
    all_expenses.max
  end

end
