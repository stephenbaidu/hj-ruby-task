require_relative 'config'

[
  [11, 1, 'active', '1', 'Description for campaign 11 - updated'],
  [12, 2, 'active', '2', 'Description for campaign 12'],
  [13, 3, 'paused', '3', 'Description for campaign 13 - updated'],
  [14, 4, 'paused', '4', 'Description for campaign 14']
].each do |data|
  DB.execute(
    'INSERT INTO campaigns(id, job_id, status, external_reference, ad_description) VALUES ( ?, ?, ?, ?, ?)',
    data
  )
end
