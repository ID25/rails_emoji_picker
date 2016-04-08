require 'forwardable'
require 'json'

module RailsEmojiPicker
  class EmojiMap
    extend Forwardable

    def_delegator :@emoji_by_moji, :[], :find_by_moji
    def_delegator :@emoji_by_name, :[], :find_by_name

    def initialize(emoji_list = nil)
      emoji_list ||= begin
        emoji_json = File.read(File.absolute_path(File.dirname(__FILE__) + 'emojis.json'))
        JSON.parse(emoji_json)
      end

      @emoji_by_name = {}
      @emoji_by_moji = {}

      emoji_list.each do |emoji_hash|
        name = emoji_hash[0]
        @emoji_by_name[name] = emoji_hash if name

        moji = emoji_hash[1]['char']
        @emoji_by_moji[moji] = emoji_hash if moji
      end
    end
  end
end
