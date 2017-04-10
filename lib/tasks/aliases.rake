# frozen_string_literal: true

desc 'Improve style'
task nag: :rubocop

desc 'Check code'
task test: :spec

desc 'lint and run tests'
task default: %i[nag test]
