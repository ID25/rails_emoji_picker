module RailsEmojiPicker
  class Engine < Rails::Engine
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    initializer 'initialize rails_emoji_picker helper' do |_app|
      ActiveSupport.on_load(:action_view) do
        include RailsEmojiPicker
      end
    end
  end
end
