require 'rails_helper'

RSpec.describe Payment, type: :model do
  before :all do
    @user = User.new(name: 'John', email: 'test@test.com', password: 'test1234')
    @category = Category.new(user: @user, name: 'Utility')
  end

  it 'Create a valid transaction' do
    transaction = Payment.new(user: @user, category: @category, name: 'Fruit', amount: 10)
    expect(transaction).to be_valid
  end

  it 'Create an invalid transaction due to wrong name' do
    transaction = Payment.new(user: @user, category: @category, amount: 10)
    expect(transaction).to be_invalid
  end

  it 'Create an invalid transaction due to wrong amount' do
    transaction = Payment.new(user: @user, category: @category, name: 'Fruits')
    expect(transaction).to be_invalid
  end
end