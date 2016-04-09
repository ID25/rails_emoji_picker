module RailsEmojiPicker
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.dirname(__FILE__)

      def copy_images
        directory 'emoji_img', 'app/assets/images/emoji_picker'
        directory 'emoji',     'app/assets/images/emoji'
      end

      def info
        puts "    =====================================================
              #{yellow '😼  😼  😼  Rails Emoji Picker'} #{yellow RailsEmojiPicker::VERSION}  #{yellow '😼  😼  😼'}
              #{blue 'Repository'}: 'https://github.com/ID25/rails_emoji_picker'
              #{blue 'Author'}: Eugene Domosedov (ID25)

          1. Add this data-attribute to your input/text field

            #{green 'data: { emojiable: true }'}

          2. Wrap your input with #{yellow '.emoji-picker-container'} css-class

            #{green 'p.emoji-picker-container'}

          3. To show text with emoji, use helper content_with_emoji

        Exaple:
          #{green 'p.emoji-picker-container'}
            #{green '= f.text_field :title, class: "form-control", data: { emojiable: true }'}

          #{green '= content_with_emoji(@post.title)'}

    =====================================================
          "
      end

      private

      def colorize(text, color_code)
        "\e[#{color_code}m#{text}\e[0m"
      end

      def green(text)
        colorize(text, 32)
      end

      def yellow(text)
        colorize(text, 33)
      end

      def blue(text)
        colorize(text, 36)
      end
    end
  end
end
