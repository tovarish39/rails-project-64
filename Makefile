# 1) первый запуск или полный сброс того что было
install: prepare_dependencies prepare_db prepare_assets prepare_assets lint_rubocop lint_slim test

# 2) на коммит
after_commit: prepare_dependencies mirgate_db prepare_assets lint_rubocop lint_slim test

prepare_dependencies:
	bundle install
	yarn install

prepare_db:
	bin/rails db:create db:migrate db:seed RAILS_ENV=production

mirgate_db:
	bin/rails db:migrate RAILS_ENV=production

prepare_assets:
	bin/rails assets:precompile

lint_rubocop:
	bundle exec rake lint:rubocop

lint_slim:
	bundle exec rake lint:slim

test:
	bin/rails test