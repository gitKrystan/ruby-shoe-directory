require "spec_helper"

describe(Store) do
  it("has many brands") do
    store = create_test_store
    brand1 = create_test_brand(store)
    brand2 = create_test_brand(store)
    expect(store.brands()).to(eq([brand1, brand2]))
  end

  it('validates presence of name') do
    test_store = Store.create(name: '')
    expect(test_store.save).to(eq(false))
  end
end
