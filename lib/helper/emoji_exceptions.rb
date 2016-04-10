module RailsEmojiPicker
  class EmojiExceptions
    class << self
      def call(emoji)
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
        when '⚽️'
          { name: 'soccer', char: '⚽️' }
        when '⚾️'
          { name: 'baseball', char: '⚾️' }
        when '⛳️'
          { name: 'golf', char: '⛳️' }
        when '☕️'
          { name: 'coffee', char: '☕️' }
        when '🀄️'
          { name: 'mahjong', char: '🀄️' }
        when '🈯️'
          { name: 'u6307', char: '🈯️' }
        when '🈚️'
          { name: 'u7121', char: '🈚️' }
        when '♿️'
          { name: 'wheelchair', char: '♿️' }
        when '🈷'
          { name: 'u6708', char: '🈷' }
        when '⛔️'
          { name: 'no_entry', char: '⛔️' }
        when '🅰'
          { name: 'a', char: '🅰' }
        when '🅱'
          { name: 'b', char: '🅱' }
        when '🅾'
          { name: 'o2', char: '🅾' }
        when '♈️'
          { name: 'aries', char: '♈️' }
        when '♉️'
          { name: 'taurus', char: '♉️' }
        when '♊️'
          { name: 'gemini', char: '♊️' }
        when '♋️'
          { name: 'cancer', char: '♋️' }
        when '♌️'
          { name: 'leo', char: '♌️' }
        when '♍️'
          { name: 'virgo', char: '♍️' }
        when '♎️'
          { name: 'libra', char: '♎️' }
        when '♏️'
          { name: 'scorpius', char: '♏️' }
        when '♐️'
          { name: 'sagittarius', char: '♐️' }
        when '♑️'
          { name: 'capricorn', char: '♑️' }
        when '♒️'
          { name: 'aquarius', char: '♒️' }
        when '♓️'
          { name: 'pisces', char: '♓️' }
        when '©'
          { name: 'copyright', char: '©' }
        when '®'
          { name: 'registered', char: '®' }
        when '❗️'
          { name: 'exclamation', char: '❗️' }
        when '™'
          { name: 'tm', char: '™' }
        when '〰'
          { name: 'curly_loop', char: '〰' }
        when '⭕️'
          { name: 'o', char: '⭕️' }
        when '🈂'
          { name: 'sa', char: '🈂' }
        when '◾️'
          { name: 'black_medium_small_square', char: '◾️' }
        when '◽️'
          { name: 'white_medium_small_square', char: '◽️' }
        when '⚫️'
          { name: 'black_circle', char: '⚫️' }
        when '⚪️'
          { name: 'white_circle', char: '⚪️' }
        when '⬜️'
          { name: 'white_large_square', char: '⬜️' }
        when '⬛️'
          { name: 'black_large_square', char: '⬛️' }
        when '⭐️'
          { name: 'star', char: '⭐️' }
        when '⛅️'
          { name: 'partly_sunny', char: '⛅️' }
        when '⚡️'
          { name: 'zap', char: '⚡️' }
        when '☔️'
          { name: 'umbrella', char: '☔️' }
        when '⚓️'
          { name: 'anchor', char: '⚓️' }
        when '⛽️'
          { name: 'fuelpump', char: '⛽️' }
        when '⌛️'
          { name: 'hourglass', char: '⌛️' }
        when '⌚️'
          { name: 'watch', char: '⌚️' }
        when '⛪️'
          { name: 'church', char: '⛪️' }
        when '⛺️'
          { name: 'tent', char: '⛺️' }
        when '⛲️'
          { name: 'fountain', char: '⛲️' }
        when '⛵️'
          { name: 'boat', char: '⛵️' }
        when '⛄️'
          { name: 'snowman', char: '⛄️' }
        when '🇯🇵'
          { name: 'jp', char: '🇯🇵' }
        when '🇰🇷'
          { name: 'kr', char: '🇰🇷' }
        when '🇩🇪'
          { name: 'de', char: '🇩🇪' }
        when '🇬🇧'
          { name: 'cn', char: '🇬🇧' }
        when '🇬🇧'
          { name: 'gd', char: '🇬🇧' }
        when '🇫🇷'
          { name: 'fr', char: '🇫🇷' }
        when '🇪🇸'
          { name: 'es', char: '🇪🇸' }
        when '🇮🇹'
          { name: 'it', char: '🇮🇹' }
        when '🇷🇺'
          { name: 'ru', char: '🇷🇺' }
        when '🇺🇸'
          { name: 'us', char: '🇺🇸' }
        else
          {}
        end
      end
    end
  end
end
