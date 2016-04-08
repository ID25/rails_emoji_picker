require_relative './emoji_regex'

module RailsEmojiPicker
  def content_with_emoji(text)
    find_emoji(text)
  end

  private

  def find_emoji(text)
    string  = replace_unicode_moji_with_images(text) || ''
    emoji   = string.scan(regex)
    unicodes = []
    index = RailsEmojiPicker::EmojiMap.new

    emoji.each do |e|
      next if e.nil?
      moji = index.find_by_moji(e)

      if moji
        name = moji[0]
        char = moji[1]['char']
      else
        moji = Emoji::Index.new.find_by_moji(e)

        name = moji['name']
        char = moji['moji']
      end

      unicodes << { name: name, char: char }
    end

    unicodes.each do |hash|
      host = 'http://localhost:3000'

      string.gsub!(hash[:char], "#{host}/assets/emoji/#{hash[:name]}.png")
    end

    string.respond_to?(:html_safe) ? string.html_safe : string
  end

  def replace_unicode_moji_with_images(string)
    return '' unless string

    string.gsub!(regex) do |moji|
      %(<span class='emoji-image'><img alt='text-alt' class="emoji" src="#{moji}"></span>)
    end
  end

  def regex
    RailsEmojiPicker::EmojiRegex.regex
  end

  def emoji_map
    RailsEmojiPicker::EmojiMap
  end
end
