class Transaction < ActiveRecord::Base

  def self.balance
    self.all.reduce(0.0) {|sum, i| sum + i.amount}
  end

  def self.total_transactions
    self.count
  end
end
