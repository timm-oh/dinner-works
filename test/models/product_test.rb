require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test ".ordered_by_position scope" do
    product_a = products(:ordered_position_0)
    product_b = products(:ordered_position_1)
    product_c = products(:ordered_position_2)

    assert_equal(
      Product.ordered_by_position.where(id: [product_a, product_b, product_c]),
      [product_a, product_b, product_c]
    )
  end
end
