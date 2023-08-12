# frozen_string_literal: true

module Langchain
  module Chunker
    # = Chunkers
    # Chunkers are used to split documents into smaller chunks before indexing into vector search databases.
    # Otherwise large documents, when retrieved and passed to LLMs, may hit the context window limits.
    #
    # == Available chunkers
    #
    # - {Langchain::Chunker::Text}
    class Base
    end

    class RecursiveTextSplitter < Base
      def split(text, chunk_size, chunk_overlap)
        chunks = []
        i = 0
        while i < text.length
          chunks << text[i, chunk_size]
          i += chunk_size - chunk_overlap
        end
        chunks
      end
    end
  end
end