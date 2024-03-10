module SavingsAccount
  def self.interest_rate(balance)
    case
      when balance < 0
        3.213
      when balance < 1000
        0.5
      when balance < 5000
        1.621
      else
        2.475
    end
  end

  def self.annual_balance_update(balance)
    interest = 1 + (interest_rate(balance) / 100)

    balance * interest
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    year = 0
    while current_balance <= desired_balance
      current_balance = annual_balance_update(current_balance)
      year += 1
    end

    year
  end
end
