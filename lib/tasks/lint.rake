# frozen_string_literal: true

desc 'Lint'.yellow
namespace :lint do
  task rubocop: :environment do
    system('rubocop -a')
  end

  task slim: :environment do
    system('slim-lint app/**/*.slim')
  end
end
