require 'journey'
describe Journey do
  subject (:journey) {described_class.new(start_station)}
  let(:start_station) {double :start_station}
  let(:finish_station) {double :finish_station}

  it "should start a journey" do
    expect(journey.start).to eq start_station
  end

  it "should finish a journey" do
    journey.finish(finish_station)
    expect(journey.end).to eq finish_station
  end

  it "calculate fare of journey" do
  
  end

  it "return whether journey is complete" do

  end
end
