if defined?(Rails)
  class Railtie < Rails::Railtie
    initializer 'initialize rails_emoji_picker helper' do |_app|
      ActiveSupport.on_load(:action_view) do
        include RailsEmojiPicker
      end
    end
  end
end
