# frozen_string_literal: true

require_relative '../lib/example.rb'

RSpec.describe Example do
  context 'initialized without arguments' do
    example = Example.new
    it 'has a value of 0' do
      expect(example.value).to eq(0)
    end
  end

  context 'initialized with 1' do
    example = Example.new 1
    it 'has a value of 1' do
      expect(example.value).to eq(1)
    end
  end
end
