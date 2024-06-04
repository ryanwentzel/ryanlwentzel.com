module Jekyll
    class RenderSmallImageUrlTag < Liquid::Tag
        def initialize(tag_name, input, tokens)
            super
            @input = input
        end

          # Lookup allows access to the page/post variables through the tag context
          # Source: https://blog.sverrirs.com/2016/04/custom-jekyll-tags.html
        def lookup(context, name)
            lookup = context
            name.split(".").each { |value| lookup = lookup[value] }
            lookup
        end

        def render(context)
            imgUrl = "#{lookup(context, 'page.img.url_sm')}"
            return imgUrl
        end
    end
end

Liquid::Template.register_tag('img_sm_url', Jekyll::RenderSmallImageUrlTag)