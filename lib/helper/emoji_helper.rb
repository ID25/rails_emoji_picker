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
        name = moji[0] if moji[0]
        char = moji[1]['char'] if moji[1]['char']
        hash_emoji = { name: name, char: char }
      else
        hash_emoji = exceptions_emoji(e)
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
    return '' unless string

    index = RailsEmojiPicker::EmojiMap.new

    string.gsub!(regex) do |moji|
      if index.find_by_moji(moji)
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

  def exceptions_emoji(emoji)
    case emoji
    when '☝'
      { name: 'point_up', char: '☝' }
    when '☺'
      { name: 'wink', char: '☺' }
    when '✌'
      { name: 'victory_hand', char: '✌' }
    when '❤'
      { name: 'heart', char: '❤' }
    when '☀'
      { name: 'sunny', char: '☀' }
    when '☁'
      { name: 'cloud', char: '☁' }
    when '❄'
      { name: 'snowflake', char: '❄' }
    when '✉'
      { name: 'email', char: '✉' }
    when '✈'
      { name: 'airplane', char: '✈' }
    when '⚠'
      { name: 'warning', char: '⚠' }
    when '♨'
      { name: 'hotsprings', char: '♨' }
    when '☎'
      { name: 'phone', char: '☎' }
    when '✂'
      { name: 'scissors', char: '✂' }
    when '✒'
      { name: 'black_nib', char: '✒' }
    when '✏'
      { name: 'pencil2', char: '✏' }
    else
      {}
    end
  end

  def regex
    RailsEmojiPicker::EmojiRegex.regex
  end

  def emoji_map
    RailsEmojiPicker::EmojiMap
  end
end
