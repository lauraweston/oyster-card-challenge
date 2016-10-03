require 'oystercard.rb'

describe Oystercard do

  it "starts with a zero balance" do
    expect(subject.balance).to eq 0
  end

it "should top up the oyster card by the given amount" do
  subject.top_up(10)
    expect(subject.balance).to eq 10
  end
end
