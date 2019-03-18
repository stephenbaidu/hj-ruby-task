require_relative 'config'

DB.execute <<-SQL
  CREATE TABLE IF NOT EXISTS campaigns(
    id INTEGER PRIMARY KEY,
    job_id INTEGER NOT NULL,
    status VARCHAR(30),
    external_reference VARCHAR(30),
    ad_description TEXT
  );
SQL
