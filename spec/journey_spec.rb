require 'journey'
describe Journey do
  subject (:journey) {described_class.new}
  let(:start_station) {double :start_station}
  let(:finish_station) {double :finish_station}

  it "should start a journey" do
    journey.start_journey(start_station)
    expect(journey.start).to eq start_station
  end

  it "should finish a journey" do
    journey.finish_journey(finish_station)
    expect(journey.finish).to eq finish_station
  end

  it "returns minimum fare for complete journey" do
    journey.start_journey(start_station)
    journey.finish_journey(finish_station)
    expect(journey.fare).to eq Journey::MINIMUM_FARE
  end

  it "returns penalty fare for incomplete journey" do
    journey.finish_journey(finish_station)
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  it "return error if no journey recorded" do
    expect{journey.fare}.to raise_error ("no journey recorded")
  end
end
