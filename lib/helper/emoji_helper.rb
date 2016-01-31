require_relative './emoji_regex'

module RailsEmojiPicker
  def emojify(content, css_class = 'emoji')
    h(content).to_str.gsub(/:([\w+-]+):/) do |match|
      if emoji = Emoji.find_by_alias(Regexp.last_match(1))
        %(<img alt="#{Regexp.last_match(1)}" src="#{image_path("emoji/#{emoji.image_filename}")}" class="#{css_class}"/>)
      else
        match
      end
    end.html_safe if content.present?
  end

  def content_with_emoji(body)
    post = find_emoji(body)
    emojify(post, 'emoji-show')
  end

  private

  def find_emoji(text)
    chars = text.split('')
    chars.each do |c|
      emoji = c.scan(regex).join('')
      c.gsub!(regex, emoji_name(Emoji.find_by_unicode(emoji).name)) if emoji.present?
    end
    chars.join('')
  end

  def emoji_name(emoji)
    ":#{emoji}:"
  end

  def regex
    RailsEmojiPicker::EmojiRegex.regex
  end
end
