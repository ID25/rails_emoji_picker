require_relative './emoji_regex'

module RailsEmojiPicker
  def content_with_emoji(text)
    find_emoji(text)
  end

  private

  def find_emoji(text)
    string  = replace_unicode_moji_with_images(text) || text
    emoji   = string.scan(regex)
    unicodes = []
    index = RailsEmojiPicker::EmojiMap.new

    emoji.each do |e|
      next if e.empty?
      tmp_emoji = e.join('')
      moji = index.find_by_moji(tmp_emoji)

      if moji
        flags = exceptions_emoji(tmp_emoji)
        if flags.empty?
          name = moji[0] if moji[0]
          char = moji[1]['char'] if moji[1]['char']
          hash_emoji = { name: name, char: char }
        else
          hash_emoji = flags
        end
      else
        hash_emoji = exceptions_emoji(tmp_emoji)
      end

      unicodes << hash_emoji
    end

    unicodes.each do |hash|
      next if hash.nil?
      hash.reject! { |i| i.nil? }

      insert_image_to_image_tag(string, hash) if hash[:char]
    end

    string.respond_to?(:html_safe) ? string.html_safe : string
  end

  def replace_unicode_moji_with_images(string)
    index = RailsEmojiPicker::EmojiMap.new

    string.gsub!(regex) do |moji|
      if moji.size < 2 && index.find_by_moji(moji)
        alt = index.find_by_moji(moji)[0]
      else
        tmp = exceptions_emoji(moji)
        alt = tmp[:name] if tmp.key?(:name)
      end

      %(<span class='emoji-image'><img alt='#{alt}' class="emoji" src="#{moji}"></span>)
    end
  end

  def insert_image_to_image_tag(string, img)
    return stanadrt_replace(string, img) unless defined? Rails

    if Rails.env.development?
      stanadrt_replace(string, img)
    elsif Rails.env.production?
      url = image_tag("emoji/#{img[:name]}.png")[/img.*?src="(.*?)"/i, 1]
      string.gsub!(img[:char], url)
    end
  end

  def stanadrt_replace(string, img)
    string.gsub!(img[:char], "#{Emoji.asset_host}#{Emoji.asset_path}/#{img[:name]}.png")
  end

  def regex
    RailsEmojiPicker::EmojiRegex.regex
  end

  def emoji_map
    RailsEmojiPicker::EmojiMap
  end

  def exceptions_emoji(emoji)
    RailsEmojiPicker::EmojiExceptions.call(emoji)
  end
end
