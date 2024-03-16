# frozen_string_literal: true

desc 'Lint'.yellow
task clear_db: :environment do
  User.destroy_all
  Category.destroy_all
end
