# Optional
class Transaction
  def initialize(amount)
    # Initialize amount and date of transaction
    @amount = amount
    @date_of_transaction = Time.now
  end

  def to_s
    # Nicely print transaction infos using Time#strftime.

  end
end
