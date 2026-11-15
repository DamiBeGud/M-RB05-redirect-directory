require "rake/testtask"
Rake::TestTask.new(:unit) do |task|
  task.libs << "test"
  task.pattern = "test/*_test.rb"
end
task default: :unit

# Unit tests must not load DB task configuration or schema helpers in the Rake
# parent process. Ordinary native migration tasks retain Rails' normal loader.
unless ARGV.empty? || ARGV == ["unit"]
  require_relative "config/application"
  Rails.application.load_tasks
end
