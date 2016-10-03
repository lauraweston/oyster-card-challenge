require 'oystercard.rb'

describe Oystercard do

  it "starts with a zero balance" do
    expect(subject.balance).to eq 0
  end

  it "should top up the oyster card by the given amount" do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

  it "should return an error if maximum top up is exceeded" do
    maximum = Oystercard::MAXIMUM_LIMIT
    subject.top_up(maximum)
    expect {subject.top_up(1)}.to raise_error("Balance cannot exceed £#{maximum}.")
  end
end
