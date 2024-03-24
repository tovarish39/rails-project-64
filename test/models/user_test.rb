# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end
  test 'check associations' do
    assert { @user.posts }
    assert { @user.comments }
    assert { @user.likes }
  end

  test 'check email' do
    first_user_email = @user.email

    another_user = users(:two)
    another_user.email = first_user_email
    assert { !another_user.valid? } # uniqueness
  end
end
