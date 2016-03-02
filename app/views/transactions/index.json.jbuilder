json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :amount, :exchange_date, :credit_or_debit, :paid_to
  json.url transaction_url(transaction, format: :json)
end
