# 1) первый запуск или полный сброс того что было
install:  prepare_gems prepare_yarn prepare_db prepare_assets prepare_assets lint_rubocop lint_slim test

# 2) на коммит
on_commit: prepare_gems prepare_yarn mirgate_db prepare_assets lint_rubocop lint_slim test

prepare_gems:
	bundle install

prepare_yarn:
	yarn install

prepare_db:
	bin/rails db:create db:migrate RAILS_ENV=production
	rake clear_db RAILS_ENV=production
	bin/rails db:seed  RAILS_ENV=production

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

