module RailsEmojiPicker
  module Generators
    class InstallGenerator < Rails::Generators::Base
      def append_to_js
        append_to_file 'app/assets/javascripts/application.js', "//= require rails_emoji_picker\n", before: "\n"
      end

      def insert_to_css
        application_css = css_type

        insert_into_file application_css, " *= require rails_emoji_picker\n", before: '*/'
      end

      def insert_to_assets
        regex = /# Add additional assets to the asset load path/
        insert_into_file 'config/initializers/assets.rb/', "\nRails.application.config.assets.paths << Emoji.images_path", after: regex
        insert_into_file 'config/initializers/assets.rb/', "\nRails.application.config.assets.precompile += %w(emoji/*.png)", after: regex
      end

      def info
        puts "    =====================================================
              😼  😼  😼  Rails Emoji Picker #{RailsEmojiPicker::VERSION}  😼  😼  😼
              Repository: 'https://github.com/ID25/rails_emoji_picker'
              Author: Eugene Domosedov (ID25)

          Add this data attribute to your input/text field

            data: { emojiable: true }

          To show text with emoji, use helper content_with_emoji

        Exaple:

          = f.text_field :title, class: 'form-control', data: { emojiable: true }

          = content_with_emoji(@post.title)

    =====================================================
          "
      end

      private

      def css_type
        css_file = if File.file?(css_file('css'))
                     css_file('css')
                   elsif File.file?(css_file('scss'))
                     css_file('scss')
                   elsif File.file?(css_file('sass'))
                     css_file('sass')
                    end
        css_file
      end

      def css_file(type)
        "app/assets/stylesheets/application.#{type}"
      end
    end
  end
end
