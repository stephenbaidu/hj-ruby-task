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