require 'spec_helper'

describe RailsEmojiPicker do
  EMOJI_MODULE = Class.new.extend(RailsEmojiPicker)

  describe '#regex' do
    it 'has valide regex' do
      expect(EMOJI_MODULE.send(:regex)).to eq RailsEmojiPicker::EmojiRegex.regex
    end
  end

  describe '#emoji_name' do
    correct_emoji_format = EMOJI_MODULE.send(:emoji_name, 'cat')

    it 'return correct emoji name' do
      expect(correct_emoji_format).to eq ':cat:'
    end
  end
end
