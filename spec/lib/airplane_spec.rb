require_relative "../../lib/airplane"
require 'pry'

describe Airplane do
  let(:airplane) { Airplane.new("cesna", 10, 150, fuel) }
  let(:fuel) { 100 }

  describe "#initialize" do
    it "has a type" do
      expect(airplane.type).to eq("cesna")
    end

    it "has a wing_loading" do
      expect(airplane.wing_loading).to eq(10)
    end

    it "has horse_power" do
      expect(airplane.horse_power).to eq(150)
    end

    it "has fuel" do
      expect(airplane.fuel).to eq(100)
    end
  end

  describe "#start" do
    context "when there is enough fuel" do
      let(:fuel) { 100 }
      context "when the engine is off" do
        it "returns 'airplane started'" do
          expect(airplane.start).to eq("airplane started. fuel remaining: 75")
        end
      end

      context "when the engine is already on" do
        it "returns 'airplane already started'" do
          airplane.start
          expect(airplane.start).to eq("airplane already started")
        end
      end
    end

    context "when there is not enough fuel" do
      let(:fuel) { 24 }
      context "when the engine is off" do
        it "returns 'not enough fuel. walk instead'" do
          expect(airplane.start).to eq("not enough fuel. walk instead.")
        end
      end
    end
  end

  describe "#takeoff" do
    context "when the plane is not started" do
      it "returns 'airplane not started, please start'" do
        expect(airplane.takeoff).to eq("airplane not started, please start")
      end
    end

    context "when the plane is already started" do
      it "returns 'airplane launched'" do
        airplane.start
        expect(airplane.takeoff).to eq("airplane launched. fuel remaining: 40")
      end
    end
  end

  describe "#land" do
    context "when the plane isn\'t on" do
      it "returns 'airplane not started, please start'" do
        expect(airplane.land).to eq("airplane not started, please start")
      end
    end

    context "when the plane is on, but not flying" do
      it "returns 'airplane already on the ground'" do
        airplane.start
        expect(airplane.land).to eq("airplane already on the ground")
      end
    end

    context "when the plane is already in the air" do
      it "returns 'airplane landed'" do
        airplane.start
        airplane.takeoff
        expect(airplane.land).to eq("airplane landed. fuel remaining: -10")
      end
    end
  end

  describe "#fuel" do
    context "when plane starts" do
      it "returns 'fuel is now 75'" do
        airplane.start
      end
    end
  end

end
