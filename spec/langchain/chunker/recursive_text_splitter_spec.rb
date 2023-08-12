require 'spec_helper'

describe Langchain::Chunker::RecursiveTextSplitter do
  let(:splitter) { described_class.new }

  describe '#split' do
    context 'when text is empty' do
      it 'returns an empty array' do
        expect(splitter.split('', 10, 5)).to eq([])
      end
    end

    context 'when text is shorter than chunk size' do
      it 'returns an array with the text as the only element' do
        expect(splitter.split('short text', 20, 5)).to eq(['short text'])
      end
    end

    context 'when text is exactly chunk size' do
      it 'returns an array with the text as the only element' do
        expect(splitter.split('exact size', 10, 5)).to eq(['exact size'])
      end
    end

    context 'when text is longer than chunk size' do
      it 'returns an array with the text split into chunks' do
        expect(splitter.split('long text long text', 10, 5)).to eq(['long text ', 'text long ', 'text'])
      end
    end
  end
end
