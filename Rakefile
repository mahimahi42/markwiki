require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)
RSpec::Core::RakeTask.new(:ospec) do |task|
    task.rspec_opts = ["--format", "progress",
                       "--format", "documentation", "--out", "output.rspec"]
end

task :default => :spec
