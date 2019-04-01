[![Build Status](https://travis-ci.com/stephenbaidu/hj-ruby-task.svg?branch=master)](https://travis-ci.com/stephenbaidu/hj-ruby-task)
[![Test Coverage](https://api.codeclimate.com/v1/badges/defdf212f9e8a42e6985/test_coverage)](https://codeclimate.com/github/stephenbaidu/hj-ruby-task/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/defdf212f9e8a42e6985/maintainability)](https://codeclimate.com/github/stephenbaidu/hj-ruby-task/maintainability)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/fc65bad0efb34c76999d9de6cb78ba81)](https://www.codacy.com/app/stephenbaidu/hj-ruby-task?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=stephenbaidu/hj-ruby-task&amp;utm_campaign=Badge_Grade)

# Ruby Task
The application comes with a sqlite3 database, which is already seeded with some data

## Setup
```sh
git clone https://github.com/stephenbaidu/hj-ruby-task
cd hj-ruby-task
bundle install
```
Start the server with `rackup` or `ruby lib/ruby_task.rb`
Then visit your browser at `localhost:8080`

## Assumptions
Local campaigns with status `deleted` were ignored but status `active` matches to remote status `enabled` and status `paused` matches to remote status `disabled`

## Notable gems
- `reek` was used to ensture there are no unwanted code smells
- `rubocop`