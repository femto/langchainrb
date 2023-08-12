# frozen_string_literal: true

require 'rspec'
require 'langchain/chunker/recursive_text_splitter'

RSpec.describe Langchain::Chunker::RecursiveTextSplitter do
  let(:splitter) { described_class.new }

  describe '#split' do
    context 'when text is empty' do
      it 'returns an empty array' do
        expect(splitter.split('', 10, 5)).to eq([])
      end
    end

    context 'when text is shorter than chunk size' do
      it 'returns an array with the text as the only element' do
        expect(splitter.split('hello', 10, 5)).to eq(['hello'])
      end
    end

    context 'when text is exactly the chunk size' do
      it 'returns an array with the text as the only element' do
        expect(splitter.split('hello world', 11, 5)).to eq(['hello world'])
      end
    end

    context 'when text is longer than chunk size' do
      it 'returns an array with chunks of the specified size' do
        expect(splitter.split('hello world', 5, 2)).to eq(['hello', 'lo wo', 'world'])
      end
    end
  end
end