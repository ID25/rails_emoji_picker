# Rails Emoji Picker

#### Simple integration of emoji picker with your rails application.
[![Gem Version](https://badge.fury.io/rb/rails_emoji_picker.svg)](https://badge.fury.io/rb/rails_emoji_picker) [![Build Status](https://travis-ci.org/ID25/rails_emoji_picker.svg?branch=master)](https://travis-ci.org/ID25/rails_emoji_picker)

## Preview
<img src="http://i.giphy.com/l2JI5BX9bj3V7PPlC.gif" alt="Rails Emoji Picker">

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rails_emoji_picker'
```

## Usage

Run command
```bash
rails g rails_emoji_picker:install
```

It copies emoji images to your `/assets/images` directory

##### Add emoji picker js file

`application.js`
```js
//= require jquery
//= require rails_emoji_picker
//= require_tree .
```

##### And styles

`application.css`

```css
/*
 *= require_tree .
 *= require rails_emoji_picker
 *= require bootstrap
 *= require_self
 */
```

`application.scss or sass`

```scss
@import 'rails_emoji_picker'
```
Next step, wrap your text input with css class `emoji-picker-container`

And add data-attribte `data: { emojiable: true }` to your input/text_area.
```erb
<p class="emoji-picker-container">
  <%= f.text_field :title, class: 'form-control', data: { emojiable: true } %>
</p>
```

To see emoji in views, wrap your text with helper `content_with_emoji`.

```erb
  <%= content_with_emoji(@post.title) %>
```

If you interpolate string, you need to call `html_safe`, because it's another string.

```erb
  <%= "Post body: #{content_with_emoji(@post.body)}".html_safe %>
```

## Emoji Asset Host
By default when used with Rails, this gem will inherit Rails configured `Rails.asset_host`.  Otherwise, you will need to manually configure the `Emoji.asset_host` as a string URL or a lambda/proc.

```ruby
# String URL
Emoji.asset_host = 'http://mysite.com'

# Custom Host Proc, takes asset path as a param
Emoji.asset_host = lambda {|path| path.size % 2 == 0 ? 'http://even.com' : 'http://odd.com'}
```

## Advices
##### Precompile emoji images in development for fast loading
##### Use github (or your hosting) as a CDN, to serve images.

Example:
```ruby
# => /initializers/emoji_picker.rb

Emoji.asset_host = 'https://raw.githubusercontent.com'
Emoji.asset_path = '/ID25/rails_emoji_picker/master/lib/generators/rails_emoji_picker/emoji/'
```

That's all! :smiley_cat:
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ID25/rails_emoji_picker.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
