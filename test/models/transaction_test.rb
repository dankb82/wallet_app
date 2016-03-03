require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "wallet balance" do
    assert_equal -30.00, Transaction.balance
  end

  test "total transactions" do
    assert_equal 3, Transaction.total_transactions
  end

  test "amount spent in current month" do
    assert_equal 30.00, Transaction.current_month_spending
  end

  test "total transactions for the month" do
    assert_equal 2, Transaction.transactions_for_month
  end

  test "total transactions for prior month" do
    assert_equal 1, Transaction.transactions_last_month
  end

  test "biggest expense this month" do
    assert_equal 20, Transaction.biggest_expense_current
  end

  test "biggest expense ever" do
    assert_equal 20, Transaction.biggest_expense_ever
  end
end
