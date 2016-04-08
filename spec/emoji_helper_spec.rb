require 'spec_helper'

describe RailsEmojiPicker do
  helper = Class.new.extend(RailsEmojiPicker)

  describe '#content_with_emoji' do
    correct_emoji_format = helper.content_with_emoji('Hello Erivan, my name is faggot 💙')

    it 'return correct emoji name' do
      expect(correct_emoji_format).to eq "Hello Erivan, my name is faggot <span class='emoji-image'><img alt='text-alt' class=\"emoji\" src=\"http://localhost:3000/assets/emoji/blue_heart.png\"></span>"
    end
  end
end
