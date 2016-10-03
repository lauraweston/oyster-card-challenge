require 'oystercard.rb'

describe Oystercard do

  subject(:card) {described_class.new}

  it "starts with a zero balance" do
    expect(card.balance).to eq 0
  end

  it "should top up the oyster card by the given amount" do
    card.top_up(10)
    expect(card.balance).to eq 10
  end

  it "should return an error if maximum top up is exceeded" do
    maximum = Oystercard::MAXIMUM_LIMIT
    card.top_up(maximum)
    expect {card.top_up(1)}.to raise_error("Balance cannot exceed £#{maximum}.")
  end

  it "should deduct a specified amount when used" do
    card.top_up(10)
    card.touch_out
    expect(card.balance).to eq 10 - Oystercard::MINIMUM_FARE
  end

  it "should register that a card has touched in" do
    card.top_up(Oystercard::MINIMUM_BALANCE + 1)
    card.touch_in
    expect(card.in_journey?).to eq true
  end

  it "should register that a card has touched out" do
    card.touch_out
    expect(card.in_journey?).to eq false
  end

  it "should raise error when touching in if balance is below minimum" do
    expect { card.touch_in }.to raise_error("Insufficient funds!")
  end

  it "should deduct the journey cost on touch out" do
    card.top_up(10)
    card.touch_in
    expect {card.touch_out}.to change{card.balance}.by(-Oystercard::MINIMUM_FARE)
  end

end
