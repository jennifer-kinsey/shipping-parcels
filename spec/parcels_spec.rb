require('rspec')
require('parcels')

describe(Parcel) do
  before() do
    Parcel.clear()
  end

  describe('#volume') do
    it('takes the length, width, and height and finds the volume') do
      test_parcel = Parcel.new(4, 5, 2, 12)
      expect(test_parcel.volume()).to(eq(40))
    end
  end

  describe("#cost_to_ship") do
    it('takes the volume and the weight and calculates the price to ship') do
      test_parcel = Parcel.new(4, 5, 2, 12)
      expect(test_parcel.cost_to_ship()).to(eq(9.60))
    end
  end

  describe("#description") do
    it('creates a string listing the values for the parcels and the cost using cost to ship method')do
      test_parcel = Parcel.new(1, 1, 1, 1)
      expect(test_parcel.description()).to(eq("Dimensions: 1in x 1in x 1in, Weight: 1lbs, Cost to Ship: $0.02"))
    end
  end

  describe(".all") do
    it("is an empty array at first") do
      expect(Parcel.all()).to(eq([]))
    end
  end

  describe("#save_parcel") do
    it("adds the parcel to the array of saved parcels") do
      test_parcel = Parcel.new(1, 1, 1, 1)
      test_parcel.save_parcel()
      expect(Parcel.all()).to(eq([test_parcel]))
    end
  end

  describe(".clear") do
    it("empties out the saved parcels") do
      Parcel.new(1, 1, 1, 1).save_parcel()
      Parcel.clear()
      expect(Parcel.all()).to(eq([]))
    end
  end
end
