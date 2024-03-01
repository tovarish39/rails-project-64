# frozen_string_literal: true

desc 'Lint'.yellow
task lint: :environment do
  puts 'start linting'
  system('slim-lint app/**/*.slim')
  system('rubocop -a')
  puts 'end linting'
end
