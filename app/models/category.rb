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
#  index_categories_on_name  (name)
#
class Category < ApplicationRecord
  has_many :posts, dependent: :restrict_with_error

  validates :name, length: { in: 5..30 }
  # непонятно почему рубокоп на это ругается. для этого поля есть индекс в бд
  validates :name, uniqueness: true # rubocop:disable Rails/UniqueValidationWithoutIndex
end
