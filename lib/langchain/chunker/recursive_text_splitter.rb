# frozen_string_literal: true

module Langchain
  module Chunker
    class RecursiveTextSplitter < Base
      def split(text, chunk_size, chunk_overlap)
        chunks = []
        i = 0
        while i < text.length
          remaining_length = text.length - i
          if remaining_length <= chunk_size
            chunks << text[i, remaining_length]
            break
          end
          chunks << text[i, chunk_size]
          i += chunk_size - chunk_overlap
        end
        chunks
      end
    end
  end
end