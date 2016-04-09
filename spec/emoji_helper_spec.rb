require 'spec_helper'

describe RailsEmojiPicker do
  helper = Class.new.extend(RailsEmojiPicker)

  describe '#content_with_emoji' do
    correct_emoji_format = helper.content_with_emoji('Test Kitty emoji 🐱')

    it 'return correct emoji name' do
      expect(correct_emoji_format).to eq "Test Kitty emoji <span class='emoji-image'><img alt='cat' class=\"emoji\" src=\"http://localhost:3000/cat.png\"></span>"
    end
  end
end
