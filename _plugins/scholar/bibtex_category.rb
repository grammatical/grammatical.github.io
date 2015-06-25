require 'jekyll/scholar'

module Jekyll
  class Scholar

    class BibTeXCategory < Page
      include Scholar::Utilities

      def initialize(site, base, dir, category)
        @site, @base, @dir = site, base, dir

        @config = Scholar.defaults.merge(site.config['scholar'] || {})
        @name = "#{category}.html"

        process(@name)
        read_yaml(File.join(base, '_layouts'), config['categories_layout'])

        data['category'] = category
      end

    end

    class CategoriesGenerator < Generator
      include Scholar::Utilities

      safe true
      priority :high

      attr_reader :config

      def generate(site)
        @site, @config = site, Scholar.defaults.merge(site.config['scholar'] || {})

        if generate_categories?
          categories = collect_categories(entries)

          categories.each do |category|
            page = BibTeXCategory.new(site, site.source, File.join('', config['categories_dir']), category)
            page.render(site.layouts, site.site_payload)
            page.write(site.dest)

            site.pages << page
          end

        end
      end

      private

      def generate_categories?
        site.layouts.key?(File.basename(config['categories_layout'], '.html'))
      end

      def collect_categories(entries)
        entries.flat_map{ |entry| entry.fields[:keywords].to_s.split }.uniq
      end
    end


  end
end
