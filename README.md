![local tests and linter](https://github.com/tovarish39/rails-project-64/actions/workflows/rubyonrails.yml/badge.svg) ![hexlet-check](https://github.com/tovarish39/rails-project-64/actions/workflows/hexlet-check.yml/badge.svg)

# Project "Collective Blog"
The project is a board of posts created by site users. Under posts, users can leave their comments (in the form of a “tree” to a certain depth) and like the post. Both logged in and non-logged in users can view posts. Site users can register and log into the site under their account. Logged in users can create posts, write comments under posts, and write comments on already created comments. Authors of posts and comments can edit and delete them.

# Technical description and requirements for project implementation
- ruby  --version # => 3.2.2
- rails --version # => 7.1.3

## Decor
- In the README.md file there is a github action badge with the status of passing tests and litner
- The README.md file contains links to the demo project

## Tests
- Minitest and power assert are used
- Faker is used to generate test data

## Naming
- Nested resources are prefixed with the name of the main entity
- Controllers and communications do not contain a prefix

## Code
- CRUDs are built through resource routing
- All links (in templates and controllers) are built only through named routing
- All interface texts are located in locale files
- The slim template engine is used for views
- Only standard Bootstrap mechanisms are used

# The project is located at the [link](https://educational-project-2.onrender.com). 

# Launch of the project
    make setup


## комментарии к невыполненым требованиям и вопросы
- нажимае вкладку "Войти", с пустыми полями нажимает кнопку "Войти". локаль определена как :ru. По каким-то непонятными причинам текст flash t('devise.failure.invalid') берётся не из файла device.ru.yml, а из device.en.yml.  с остальными текстами так не происходит. поставлена "заглушка". в файле devise.en.yml по этой позиции поставлен русский текст, вместо английского. c t('devise.failure.unauthenticated') и  t('devise.failure.unconfirmed')  такая же история

- с проверкой hexlet-check не смог до конца разобраться. падает на LikesControllerTest#test_#destroy_by_other_user. всё вроде рабтает, но не понятно что именно тесту не нравится. у меня сделано, что лайк может ставить и убирать свой лайк только залогиненный юзер