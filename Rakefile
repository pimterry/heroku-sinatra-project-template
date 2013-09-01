require 'rake/testtask'
require 'cucumber'
require 'cucumber/rake/task'

# These explicit initial tasks are probably the only ones you want to run
# directly yourself most of the time
task :local_test => [:unit, :js_unit, :component, :js_component]

task :local_integration do |t, args|
  Rake::Task['integration'].invoke('http://127.0.0.1:8080', args)
end

task :staging_integration do |t, args|
  Rake::Task['integration'].invoke('http://comparably-test.herokuapp.com', args)
end

# Definitions for specific test suites:

Rake::TestTask.new 'unit' do |t|
  t.libs << '.'
  t.test_files = FileList['test/unit/**/*_test.rb']
end

task :js_unit do

end

Rake::TestTask.new 'component' do |t|
  t.libs << '.'
  t.test_files = FileList['test/component/**/*_test.rb']
end

task :js_component do

end

task :integration, :target do |t, args|
  puts "Running integration suite against #{args[:target]}"
  ENV['INTEGRATION_TEST_TARGET'] = args[:target]

  if args[:wd_url] then
    puts "Using webdriver at #{args[:wd_url]}"
    ENV['WEBDRIVER_URL'] = args[:wd_url]
  else
    puts "Using local headless browser"
  end

  Rake::Task['run_integration'].invoke
end

Cucumber::Rake::Task.new(:run_integration) do |t|
  t.cucumber_opts = "test/integration/features --format pretty -r test/integration/steps"
end
