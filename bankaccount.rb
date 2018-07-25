class BankAccount

  @@interest_rate = 0.01

  @@accounts = []

  def initialize
    @balance = 0
  end

  #Reader Methods
  def balance
    @balance
  end

  # def self.accounts
  #   @@accounts
  # end

  #Writer Methods
  # def balance=(balance)
  #   @balance = balance
  # end

  #Instance Methods
  def deposit(deposit)
    @balance += deposit
  end

  def withdraw(withdraw)
    @balance -= withdraw
  end

  def self.create
    @@accounts << BankAccount.new
    @@accounts[-1]
  end

  def self.total_funds
    total = []
    # total = @@accounts.sum
    # total
    @@accounts.each do |a|
      total << a.balance
    end
    total.sum
  end

  def self.interest_time
    # @balance *= (1 + @@interest_rate)
    @@accounts.each do |a|
      a.deposit(@@interest_rate * a.balance)
    end

  end

end

my_account = BankAccount.create
your_account = BankAccount.create
puts my_account.balance # 0
puts your_account.balance # 0
# my_account = 4000
# your_account = 7000
# puts BankAccount.accounts
puts BankAccount.total_funds # 0
my_account.deposit(200)
your_account.deposit(1000)
puts my_account.balance # 200
puts your_account.balance # 1000
puts BankAccount.total_funds # 1200
BankAccount.interest_time
puts my_account.balance # 202.0
puts your_account.balance # 1010.0
puts BankAccount.total_funds # 1212.0
my_account.withdraw(50)
puts my_account.balance # 152.0
puts BankAccount.total_funds # 1162.0
