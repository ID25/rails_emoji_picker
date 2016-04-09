require 'spec_helper'

describe RailsEmojiPicker do
  helper = Class.new.extend(RailsEmojiPicker)

  describe '#content_with_emoji' do
    correct_emoji_format = helper.content_with_emoji('Test Kitty emoji 🐱')

    it 'return correct image src with emoji' do
      expect(correct_emoji_format).to eq "Test Kitty emoji <span class='emoji-image'><img alt='cat' class=\"emoji\" src=\"#{Emoji.asset_host}#{Emoji.asset_path}/cat.png\"></span>"
    end
  end

  describe 'custom asset_host and asset_path' do
    it 'return img src tag with custom host and path' do
      Emoji.asset_host = 'https://mysite.com/'
      Emoji.asset_path = '/images/emoji/'
      string = helper.content_with_emoji('Test String 🐱')

      expect(string).to eq "Test String <span class='emoji-image'><img alt='cat' class=\"emoji\" src=\"https://mysite.com/images/emoji//cat.png\"></span>"
    end
  end
end
