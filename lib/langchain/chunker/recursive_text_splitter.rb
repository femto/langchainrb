# frozen_string_literal: true

module Langchain
  module Chunker
    class RecursiveTextSplitter < Base
      def split(text, chunk_size, chunk_overlap)
        chunks = []
        i = 0
        while i < text.length
          if text.length - i < chunk_size
            chunks << text[i..-1]
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