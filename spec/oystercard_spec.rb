require 'oystercard.rb'

describe Oystercard do

  it "starts with a zero balance" do
    expect(subject.balance).to eq 0
  end

end
