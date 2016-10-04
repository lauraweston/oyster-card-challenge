require 'oystercard.rb'

describe Oystercard do

  subject(:card) { described_class.new }
  let(:station) { double :station }

  it "starts with a zero balance" do
    expect(card.balance).to eq 0
  end

  context "topping up" do
    before do
      card.top_up(Oystercard::MAXIMUM_LIMIT)
    end
    it "should top up the oyster card by the given amount" do
      expect(card.balance).to eq Oystercard::MAXIMUM_LIMIT
    end
    it "should return an error if maximum top up is exceeded" do
      expect {card.top_up(1)}.to raise_error("Balance cannot exceed £#{Oystercard::MAXIMUM_LIMIT}.")
    end
  end

  context "when touching in" do
    before do
      card.top_up(Oystercard::MINIMUM_BALANCE)
      card.touch_in(station)
    end
    it "should register that a card has touched in" do
      expect(card.in_journey?).to eq true
    end
    it "should remember entry station" do
      expect(card.entry_station).to eq station
    end
    it "should raise error if balance is below minimum" do
      card.touch_out
      expect { card.touch_in(station) }.to raise_error("Insufficient funds!")
    end
  end

  context "when touching out" do
    before do
      card.top_up(Oystercard::MAXIMUM_LIMIT)
      card.touch_in(station)
      card.touch_out
    end
    it "should register that a card has touched out" do
      expect(card.in_journey?).to eq false
    end
    it "should deduct the journey cost" do
      card.touch_in(station)
      expect {card.touch_out}.to change{card.balance}.by(-Oystercard::MINIMUM_FARE)
    end
    it "should forget entry station" do
      expect(card.entry_station).to eq nil
    end
  end

end
