$(function() {
  window.emojiPicker = new EmojiPicker({
    emojiable_selector: '[data-emojiable=true]',
    assetsPath: '/emoji_img/',
    popupButtonClasses: 'fa fa-smile-o',
  });
  window.emojiPicker.discover();
});
