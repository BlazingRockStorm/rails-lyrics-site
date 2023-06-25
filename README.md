# README

- Container
- PostgreSQL
- Ruby 3.1
- Rails 7
- ReactJS for front-end
- RSpec for test
- Coding Convention, Code Coverage

## Why

### Github:

- This is a public repo.
- The overall CI/CD workflow is easier to manage in GitHub especially using GitHub actions.
- In case of GitHub, because of vendor neutral, I can easily switch cloud provider without worrying about repo migration.

#### AWS:

- Best support.
- Have experiences.
- Hearing from other teams in the company about the pains in other cloud platforms, over pros and cons, I feel AWS is the best choice I can make

### Github Actions for Pronto-Rubocop check:

- It is only the coding convention, so only important for the code, not for the product.
- Free.
- Run shot time.

### AWS for RSpec check:

- The test for how the app works, so it must run more stable.
- Take times.

## TODO:

- [x] Setup Github actions for Rubocop check -> Pronto
- [x] Setup code coverage
- [ ] Add an admin template
- [x] Add songs
- [ ] Setup JS
