require "spec_helper"

describe(Brand) do
  it("has many stores") do
    brand = create_test_brand
    store1 = create_test_store(brand)
    store2 = create_test_store(brand)
    expect(brand.stores()).to(eq([store1, store2]))
  end

  it('validates presence of name') do
    test_brand = Brand.create(name: '')
    expect(test_brand.save).to(eq(false))
  end

  describe('#capitalize') do
    it ('capitalizes the name before save') do
      test_brand = create_test_brand
      expect(test_brand.name).to(eq("Test Brand"))
    end
  end
end
