require 'rake'
require 'rake/testtask'
require 'open3'
 
Rake::TestTask.new do |t|
  t.test_files = Dir.glob('test/**/test_*.rb')
  t.verbose = true
end
 
task default: :test

desc 'Check syntax of all ruby files'
task :syntax do
  Dir['**/*.rb'].each do |file|
    Open3.popen3("ruby -c #{file}") do |stdin, stdout, stderr|
      if error = ((stderr.readline rescue false))
        puts error
      end
      stdin.close rescue false
      stdout.close rescue false
      stderr.close rescue false
    end
  end
end
