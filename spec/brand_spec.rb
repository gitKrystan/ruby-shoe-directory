require "spec_helper"

describe(Brand) do
  it("has many stores") do
    brand = create_test_brand
    store1 = create_test_store(brand)
    store2 = create_test_store(brand)
    expect(brand.stores()).to(eq([store1, store2]))
  end
end
