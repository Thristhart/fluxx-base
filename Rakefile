require 'rake'
require 'rake/testtask'
 
Rake::TestTask.new do |t|
  t.test_files = Dir.glob('test/**/test_*.rb')
  t.verbose = true
end
 
task default: :test
