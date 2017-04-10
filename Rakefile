# Tasks for ruby-template
# frozen_string_literal: true

Dir.glob('lib/tasks/*.rake').each do |rake|
  load rake unless rake.include? 'aliases'
end

load 'lib/tasks/aliases.rake' if File.exist? 'lib/tasks/aliases.rake'
