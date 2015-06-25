require 'jekyll/scholar'

module Jekyll
  class Scholar

    class KeywordsTag < Liquid::Tag

      # This fixes the problem that the context.registers[:site] is not
      # available, e.g. from a sublayout.
      @categories_dir = Jekyll.configuration({})['scholar']['categories_dir']

      class << self
        attr_reader :categories_dir
      end

      def initialize(tag_name, keywords, tokens)
        super
        @keywords = keywords
      end
  
      def render(context)
        keywords = parse_keywords(context).map do |word|
          url = File.join(KeywordsTag.categories_dir, "#{word}.html")
          "<a class='btn btn-xs btn-primary' href=\"/#{url}\">#{word}</a>"
        end
        "<span class='bibtex-keywords'>#{keywords.join(' ')}</span>"
      end
  
      private
  
      def parse_keywords(context)
        @keywords.split.flat_map do |word|
          word = word.to_s.split('.')
          word = context.environments.first[word[0]][word[1]] if word.size == 2
          word.to_s.split
        end
      end
    end

  end
end

Liquid::Template.register_tag('keywords', Jekyll::Scholar::KeywordsTag)
