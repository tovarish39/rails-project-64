# 1) первый запуск или полный сброс того что было
install: prepare_dependencies prepare_db prepare_assets prepare_assets lint_rubocop lint_slim test

# 2) на коммит
after_commit: prepare_dependencies mirgate_db prepare_assets lint_rubocop lint_slim test
prepare_dependencies:
	@tput setaf 3 && echo '----------start install gems...' && tput sgr0
	bundle install
	@tput setaf 3 && echo '----------start install yarn dependencies...' && tput sgr0
	yarn install

prepare_db:
	@tput setaf 3 && echo '----------preparing database...' && tput sgr0
	bin/rails db:drop db:create db:migrate db:seed

mirgate_db:
	@tput setaf 3 && echo '----------migrate database...' && tput sgr0
	bin/rails db:migrate db:seed

prepare_assets:
	@tput setaf 3 && echo '----------preparing assets...' && tput sgr0
	bin/rails assets:precompile

lint_rubocop:
	@tput setaf 3 && echo '----------linting by rubocop...' && tput sgr0
	bundle exec rake lint:rubocop

lint_slim:
	@tput setaf 3 && echo '----------linting by slim-lint...' && tput sgr0
	bundle exec rake lint:slim

test:
	@tput setaf 3 && echo '----------start local tests...' && tput sgr0
	bin/rails test