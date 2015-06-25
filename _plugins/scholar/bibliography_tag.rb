require 'jekyll/scholar'

module Jekyll
  class Scholar

    class BibliographyTag
      alias_method :original_render, :render

      def render(context)
        if context.environments.first['page'].has_key? 'category'
          category = context.environments.first['page']['category']
          @query = "@*[keywords^=.*#{category}.*]"
        end
        original_render(context)
      end
    end
  end
end
