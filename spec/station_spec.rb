require "station"

describe Station do
  subject(:station) { described_class.new("Waterloo", 1) }

  it "should have a given zone" do
    expect(station.zone).to eq 1
  end

  it "should have a given name" do
    expect(station.name).to eq "Waterloo"
  end
end
