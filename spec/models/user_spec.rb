require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(id: 1, name: 'Awais', email: 'awais@test.com', password: 'test1234') }

  it 'Should be valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'Should not be valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Should not be valid without a valid email address' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end