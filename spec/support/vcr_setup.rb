VCR.config do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end
