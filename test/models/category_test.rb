# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = Category.new
  end

  test 'check :name' do
    @category.name = 'i' * 3
    assert { !@category.valid? } # minimum 4 characters

    valid_name = 'i' * 4
    @category.name = valid_name
    assert { @category.valid? } # valid

    valid_name = 'i' * 100
    @category.name = valid_name
    assert { @category.valid? } # valid

    @category.name = 'i' * 101
    assert { !@category.valid? } # maximum 100 characters

    @category.name = valid_name
    assert { @category.save }

    not_uniq_category = Category.new(name: valid_name)
    assert { !not_uniq_category.save } # uniqueness
  end
end
