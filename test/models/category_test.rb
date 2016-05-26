require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test "the counts" do
    assert_equal 3, Category.with_product.count

    assert_equal 3, categories(:one).all_product_ids.flatten.uniq.count
    assert_equal 2, categories(:two).all_product_ids.flatten.uniq.count
    assert_equal 1, categories(:three).all_product_ids.flatten.uniq.count
    assert_equal 0, categories(:empty).all_product_ids.flatten.uniq.count

    assert_equal 3, Category.parent_to_be.count
    assert_equal 2, Category.top_level.count
    assert_equal 1, Category.sub_level.count
    assert_equal 1, Category.end_level.count
  end
end
