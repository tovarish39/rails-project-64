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
  validates :name, uniqueness: true # по рекомендациям рубокопа был добавлен индекс для поля :name через миграцию, но почему-то рубокоп всё равно определяет как ошибку
end
