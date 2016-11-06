# Tasks for ruby-template
# frozen_string_literal: true

Dir.glob('lib/tasks/*.rake').each { |rake| load rake }

desc 'Improve style'
task nag: :rubocop

desc 'Check code'
task test: :spec

desc 'lint and run tests'
task default: [:nag, :test]
