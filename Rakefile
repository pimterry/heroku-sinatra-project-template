require 'rake/testtask'

# These explicit initial tasks are probably the only ones you want to run
# directly yourself most of the time
task :local_test => [:unit, :js_unit, :functional, :js_functional]

task :local_integration do
  Rake::Task['integration'].invoke 'http://localhost:8080'
end

task :staging_integration do
  Rake::Task['integration'].invoke 'http://comparably-test.herokuapp.com'
end

# Definitions for specific test suites:

Rake::TestTask.new 'unit' do |t|
  t.libs << '.'
  t.test_files = FileList['test/unit/**/*_test.rb']
end

task :js_unit do

end

Rake::TestTask.new 'functional' do |t|
  t.libs << '.'
  t.test_files = FileList['test/functional/**/*_test.rb']
end

task :js_functional do

end

task :integration, :target do |t, args|
  puts "Running integration suite against #{args[:target]}"
  ENV['INTEGRATION_TEST_TARGET'] = args[:target]
  Rake::Task['run-integration'].invoke
end

Rake::TestTask.new 'run-integration' do |t|
  t.test_files = FileList['test/integration/**/*_test.rb']
end